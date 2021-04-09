package com.jaeho.atgg.utility;

import java.io.IOException;
import java.util.HashMap;

import com.google.gson.Gson;
import com.jaeho.atgg.domain.LeagueEntryVO;
import com.jaeho.atgg.domain.SummonerVO;
import com.jaeho.atgg.service.SummonerService;

import lombok.extern.log4j.Log4j;

@Log4j
public class RiotAPIUtility extends RestAPIUtility {

	// 커넥션 Pool
	// private static ConnectionPool connectionPool = new ConnectionPool();
	private static Gson gson = new Gson();

	// Riot API
	private final static String API_KEY = "RGAPI-09e5a48d-9f5d-4552-83af-67a2358a866a";

	// API EndPoint
	private final static String SUMMONER_BY_NAME = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/";
	private final static String LEAGUE_ENTRY = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/";

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

						service.insertLeagueInfo(leagueEntry);

						// 승급전이 있다면
						if (leagueEntry.getMiniSeries() != null) {
							leagueEntry.getMiniSeries().setName(summonerName);
							service.insertMiniseries(leagueEntry.getMiniSeries());
						}
					}
				}
			} else {
				log.error("소환사 정보 통신에 실패했습니다.");
			}
		} else {
			log.info("데이터가 이미 있습니다.");
		}
	}
}