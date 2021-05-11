package com.jaeho.atgg.utility;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.jaeho.atgg.domain.match.ParticipantVO;
import com.jaeho.atgg.domain.match.TeamsVO;
import com.jaeho.atgg.domain.summoner.LeagueEntryVO;
import com.jaeho.atgg.domain.summoner.SummonerVO;
import com.jaeho.atgg.dto.MatchDTO;
import com.jaeho.atgg.mapper.MatchMapper;
import com.jaeho.atgg.service.MatchService;
import com.jaeho.atgg.service.SummonerService;

import jdk.nashorn.internal.objects.annotations.Setter;
import lombok.extern.log4j.Log4j;

// RiotAPI 통신 클래스입니다.
// - Riot의 데이터를 얻어와 My DB에 저장하는 역할을 수행합니다.
// - 동시에 My DB에 데이터가 있다면 DB 데이터를 보내줍니다.
@Log4j
public class RiotAPIUtility extends RestAPIUtility {

	// Riot API
	private final static String API_KEY = "RGAPI-c112286d-0d0b-4ecd-9a20-7f07fe524ad8";

	// API EndPoint
	// 소환사 기본 정보
	private final static String SUMMONER_BY_NAME = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/";
	// 소환사 티어 정보
	private final static String LEAGUE_ENTRY = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/";
	// 소환사 전적 정보
	private final static String MATCH_LIST = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/";
	// 소환사 전적 상세 정보
	private final static String MATCH_INFO = "https://kr.api.riotgames.com/lol/match/v4/matches/";

	private static RiotStaticDataUtility utility = new RiotStaticDataUtility();

	// 최초 소환사 정보 초기화
	// - 소환사 정보 , 소환사 랭크 , 소환사 승급전
	public static void initSummonerInfo(SummonerService service, String summonerName) throws IOException {

		// 데이터 베이스에 정보가 있는지 판별
		if (!service.isDuplicateDateCheck(summonerName)) {
			// 소환사 정보 http 통신
			String summonerResult = syncRestAPI(SUMMONER_BY_NAME + summonerName, new HashMap<String, String>() {
				{
					put("X-Riot-Token", API_KEY);
				}
			});

			if (!summonerResult.equals("404")) {
				SummonerVO summoner = new Gson().fromJson(summonerResult, SummonerVO.class);
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
	public static void initMatchInfo(MatchService service, String accountId, int beginIndex, int endIndex)
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

		int bTotalKills = 0; // 팀 전체 킬
		int bTotalDeaths = 0; // 팀 전체 데스
		int bTotalAssists = 0; // 팀 전체 어시스트

		int rTotalKills = 0; // 팀 전체 킬
		int rTotalDeaths = 0; // 팀 전체 데스
		int rTotalAssists = 0; // 팀 전체 어시스트

		long maxDamage = 0;

		MatchDTO match = new Gson().fromJson(result, MatchDTO.class);
		match.setQueueId(utility.getQueueByName(match.getQueueId()));
		
		match.setCreateTimeString(TimeCalculate.createTimeByDateToString(match.getGameCreation()));
		match.setDurationTimeString(TimeCalculate.durationTimeByDateToString(match.getGameDuration()));
		
//		log.info("==========================");
//		log.info("게임 아이디 : getGameId");
//		log.info(match.getGameId());
//
//		log.info("게임 종류 : getQueueId");
//		log.info(match.getQueueId());
//
//		log.info("게임 시작 시간 : getGameCreation");
//		log.info(match.getGameCreation());
//
//		log.info("총 게임 시간 : getGameDuration");
//		log.info(match.getGameDuration());

		for (int j = 0; j < match.getParticipants().size(); j++) {

			// 게임 전체 최고 데미지
			if (maxDamage < match.getParticipants().get(j).getStats().getTotalDamageDealtToChampions()) {
				maxDamage = match.getParticipants().get(j).getStats().getTotalDamageDealtToChampions();
			}

			// 블루팀
			if (match.getParticipants().get(j).getParticipantId() <= 5) {
				bTotalKills += match.getParticipants().get(j).getStats().getKills();
				bTotalDeaths += match.getParticipants().get(j).getStats().getDeaths();
				bTotalAssists += match.getParticipants().get(j).getStats().getAssists();
			}

			// 레드팀
			else {
				rTotalKills += match.getParticipants().get(j).getStats().getKills();
				rTotalDeaths += match.getParticipants().get(j).getStats().getDeaths();
				rTotalAssists += match.getParticipants().get(j).getStats().getAssists();
			}

			String championId = match.getParticipants().get(j).getChampionId();
			String spell1 = match.getParticipants().get(j).getSpell1Id();
			String spell2 = match.getParticipants().get(j).getSpell2Id();

			// 챔피언 정보 변경
			match.getParticipants().get(j).setChampionId(utility.getChampionByName(championId));

			// 소환사 스펠 정보 변경
			match.getParticipants().get(j).setSpell1Id(utility.getSpellByName(spell1));
			match.getParticipants().get(j).setSpell2Id(utility.getSpellByName(spell2));

			match.getParticipants().get(j).setGameId(match.getGameId());

			match.getParticipants().get(j)
					.setSummoner(match.getParticipantIdentities().get(j).getPlayer().getSummonerName());

			match.getParticipants().get(j).getStats().setGameId(match.getGameId());

			if (match.getParticipants().get(j).getStats().getWin().equals("true")) {
				match.getParticipants().get(j).getStats().setWin("승리");
			} else {
				match.getParticipants().get(j).getStats().setWin("패배");
			}

			match.getParticipants().get(j).getTimeline().setGameId(match.getGameId());
		}

//		log.info("팀 정보 : getTeams");
		for (int i = 0; i < match.getTeams().size(); i++) {
			match.getTeams().get(i).setGameId(match.getGameId());

			if (match.getTeams().get(i).getTeamId() == 100) {
				match.getTeams().get(i).setTotalKills(bTotalKills);
				match.getTeams().get(i).setTotalDeaths(bTotalDeaths);
				match.getTeams().get(i).setTotalAssists(bTotalAssists);
			} else {
				match.getTeams().get(i).setTotalKills(rTotalKills);
				match.getTeams().get(i).setTotalDeaths(rTotalDeaths);
				match.getTeams().get(i).setTotalAssists(rTotalAssists);
			}
		}

		match.setMaxDamage(maxDamage);

//		log.info("소환사 기본 정보 : getParticipants");
//		match.getParticipants().forEach(participant -> {
//			log.info(participant);
//		});
//
//		log.info("게임 참여자 정보 : getParticipantIdentities");
//		match.getParticipantIdentities().forEach(identities -> {
//			log.info(identities);
//		});
//
//		log.info("==========================");

		return match;
	}

	// 소환사 매칭 정보 리스트
	private static List<String> getMatchList(int beginIndex, int endIndex, String accountId) throws IOException {
		Map<String, String> headers = new HashMap<String, String>();
		Map<String, String> parameters = new HashMap<String, String>();

		List<String> gameIdList = new ArrayList<>();

		headers.put("X-Riot-Token", API_KEY);
		parameters.put("beginIndex", Integer.toString(beginIndex));
		parameters.put("endIndex", Integer.toString(endIndex));

		String result = syncRestAPI(MATCH_LIST + accountId, headers, parameters);

		JsonArray matchList = new JsonParser().parse(result).getAsJsonObject().getAsJsonArray("matches");

		for (int i = 0; i < matchList.size(); i++) {
			String gameId = matchList.get(i).getAsJsonObject().get("gameId").getAsString();
			gameIdList.add(gameId);
//			log.info(gameId);
		}

		return gameIdList;
	}
}