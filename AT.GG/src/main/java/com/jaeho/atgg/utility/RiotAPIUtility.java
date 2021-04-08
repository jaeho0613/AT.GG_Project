package com.jaeho.atgg.utility;

import java.io.IOException;
import java.util.HashMap;

import com.google.gson.Gson;
import com.jaeho.atgg.domain.SummonerVO;
import com.jaeho.atgg.mapper.SummonerMapper;
import com.jaeho.atgg.service.SummonerService;

public class RiotAPIUtility extends RestAPIUtility {

	// 커넥션 Pool
	// private static ConnectionPool connectionPool = new ConnectionPool();

	// Riot API
	private final static String API_KEY = "RGAPI-ff0d42b2-03d8-494d-912a-6663dd10a278";

	// API EndPoint
	private final static String SUMMONER_BY_NAME = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/";

	// 소환사 정보 가져오기
	public static SummonerVO getSummonerByName(SummonerService service, String summonerName) throws IOException {

		// 데이터가 없다면
		if (!service.isDuplicateDateCheck(summonerName)) {

			Gson gson = new Gson();

			String result = restAPI(SUMMONER_BY_NAME + summonerName, new HashMap<String, String>() {
				{
					put("X-Riot-Token", API_KEY);
				}
			});

			if (!result.equals("404")) {
				SummonerVO summoner = gson.fromJson(result, SummonerVO.class);
				summoner.setName(summonerName);
				service.insertSummoner(summoner);
				return summoner;
			} else {
				return null;
			}

			// 데이터가 있다면
		} else {
			return service.getSummoner(summonerName);
		}
	}
}
