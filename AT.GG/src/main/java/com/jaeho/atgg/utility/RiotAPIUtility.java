package com.jaeho.atgg.utility;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.jaeho.atgg.domain.match.ParticipantVO;
import com.jaeho.atgg.domain.match.TeamsVO;
import com.jaeho.atgg.domain.summoner.LeagueEntryVO;
import com.jaeho.atgg.domain.summoner.SummonerVO;
import com.jaeho.atgg.dto.MatchDTO;
import com.jaeho.atgg.mapper.MatchMapper;
import com.jaeho.atgg.service.MatchService;
import com.jaeho.atgg.service.SummonerService;

import lombok.extern.log4j.Log4j;

// RiotAPI 통신 클래스입니다.
// - Riot의 데이터를 얻어와 My DB에 저장하는 역할을 수행합니다.
// - 동시에 My DB에 데이터가 있다면 DB 데이터를 보내줍니다.
@Log4j
public class RiotAPIUtility extends RestAPIUtility {

	// 커넥션 Pool
	// private static ConnectionPool connectionPool = new ConnectionPool();
	private static Gson gson = new Gson();

	// Riot API
	private final static String API_KEY = "RGAPI-42bfc354-b286-44f0-9319-8164b8be0ed4";

	// API EndPoint
	// 소환사 기본 정보
	private final static String SUMMONER_BY_NAME = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/";
	// 소환사 티어 정보
	private final static String LEAGUE_ENTRY = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/";
	// 소환사 전적 정보
	private final static String MATCH_LIST = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/";
	// 소환사 전적 상세 정보
	private final static String MATCH_INFO = "https://kr.api.riotgames.com/lol/match/v4/matches/";

	// 최초 소환사 정보 초기화
	// - 소환사 정보 , 소환사 랭크 , 소환사 승급전
	public static void initSummonerInfo(SummonerService service, String summonerName) throws IOException {

		if (!service.isDuplicateDateCheck(summonerName)) {
			// 소환사 정보 http 통신
			String summonerResult = syncRestAPI(SUMMONER_BY_NAME + summonerName, new HashMap<String, String>() {
				{
					put("X-Riot-Token", API_KEY);
				}
			});

			if (!summonerResult.equals("404")) {
				SummonerVO summoner = gson.fromJson(summonerResult, SummonerVO.class);
				summoner.setName(summonerName);

				// DB에 저장
				service.insertSummonerInfo(summoner);

				// 소환사 티어 정보 http 통신
				String leagueEntryResult = syncRestAPI(LEAGUE_ENTRY + summoner.getId(), new HashMap<String, String>() {
					{
						put("X-Riot-Token", API_KEY);
					}
				});

				if (!leagueEntryResult.equals("404")) {
					LeagueEntryVO[] leagues = new Gson().fromJson(leagueEntryResult, LeagueEntryVO[].class);

					for (LeagueEntryVO leagueEntry : leagues) {
						leagueEntry.setSummonerName(summonerName);
						service.insertLeagueInfo(leagueEntry);

						// 승급전이 있다면
						if (leagueEntry.getMiniSeries() != null) {
							leagueEntry.getMiniSeries().setName(summonerName);
							leagueEntry.getMiniSeries().setType(leagueEntry.getQueueType());
							service.insertMiniseries(leagueEntry.getMiniSeries());
						}
					}
				} else {
					log.error("소환사 티어 정보 통신에 실패했습니다.");
				}
			} else {
				log.error("소환사 정보 통신에 실패했습니다.");
			}
		} else {
			log.info("데이터가 이미 있습니다.");
		}
	}

	// 소환사 매칭 데이터
	// - 소환사 룬, 딜량, 팀 전적 등등
	public static void initMatchInfo(MatchService service, String accountId, String beginIndex, String endIndex)
			throws IOException {

		List<String> gameIdList = getMatchList(beginIndex, endIndex, accountId);
		gameIdList.forEach(id -> {

			try {
				if (!service.isDuplicateDateCheck(id)) {
					service.insertMatchRef(getMatchRef(id));
				} else {
					log.info("매칭 데이터가 있습니다.");
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
	}

	// 매치 상세 정보
	private static MatchDTO getMatchRef(String gameId) throws IOException {

		// 게임 리스트 불러오기
		String result = RestAPIUtility.asyncRestAPI(MATCH_INFO + gameId, new HashMap<String, String>() {
			{
				put("X-Riot-Token", API_KEY);
			}
		});

		MatchDTO match = new Gson().fromJson(result, MatchDTO.class);
		log.info("==========================");
		log.info("게임 아이디 : getGameId");
		log.info(match.getGameId());

		log.info("게임 종류 : getQueueId");
		log.info(match.getQueueId());

		log.info("게임 시작 시간 : getGameCreation");
		log.info(match.getGameCreation());

		log.info("총 게임 시간 : getGameDuration");
		log.info(match.getGameDuration());

		log.info("팀 정보 : getTeams");
		match.getTeams().forEach(team -> {
			team.setGameId(match.getGameId());
			log.info(team);
		});

		for (int j = 0; j < match.getParticipants().size(); j++) {

			match.getParticipants().get(j).setGameId(match.getGameId());

			match.getParticipants().get(j)
					.setSummoner(match.getParticipantIdentities().get(j).getPlayer().getSummonerName());

			match.getParticipants().get(j).getStats().setGameId(match.getGameId());

			match.getParticipants().get(j).getTimeline().setGameId(match.getGameId());

		}

		log.info("소환사 기본 정보 : getParticipants");
		match.getParticipants().forEach(participant -> {
			log.info(participant);
		});

		log.info("게임 참여자 정보 : getParticipantIdentities");
		match.getParticipantIdentities().forEach(identities -> {
			log.info(identities);
		});

		log.info("==========================");

		return match;
	}

	// 소환사 매칭 정보 리스트
	private static List<String> getMatchList(String beginIndex, String endIndex, String accountId) throws IOException {
		Map<String, String> headers = new HashMap<String, String>();
		Map<String, String> parameters = new HashMap<String, String>();

		List<String> gameIdList = new ArrayList<>();

		headers.put("X-Riot-Token", API_KEY);
		parameters.put("beginIndex", beginIndex);
		parameters.put("endIndex", endIndex);

		String result = syncRestAPI(MATCH_LIST + accountId, headers, parameters);

		JsonArray matchList = new JsonParser().parse(result).getAsJsonObject().getAsJsonArray("matches");

		for (int i = 0; i < matchList.size(); i++) {
			String gameId = matchList.get(i).getAsJsonObject().get("gameId").getAsString();
			gameIdList.add(gameId);
			log.info(gameId);
		}

		return gameIdList;
	}
}