package com.jaeho.atgg.utility;

import java.io.IOException;
import java.util.HashMap;

import com.google.gson.Gson;
import com.jaeho.atgg.domain.summoner.LeagueEntryVO;
import com.jaeho.atgg.domain.summoner.SummonerVO;
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
	private final static String API_KEY = "RGAPI-18346a88-f665-4f60-8768-15981c2be879";

	// API EndPoint
	private final static String SUMMONER_BY_NAME = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"; // 소환사 정보
	private final static String LEAGUE_ENTRY = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/"; // 소환사 리그 정보
	private final static String MATCH_LIST = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/"; // 소환사 라인

	// 최초 소환사 정보 초기화
	// - 소환사 정보 , 소환사 랭크 , 소환사 승급전
	public static void initSummonerInfo(SummonerService service, String summonerName) throws IOException {

		if (!service.isDuplicateDateCheck(summonerName)) {
			// 소환사 정보 http 통신
			String summonerResult = restAPI(SUMMONER_BY_NAME + summonerName, new HashMap<String, String>() {
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
				String leagueEntryResult = restAPI(LEAGUE_ENTRY + summoner.getId(), new HashMap<String, String>() {
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

	// 소환사 매칭 정보
	public static void initMatchInfo() {
		
	}
}