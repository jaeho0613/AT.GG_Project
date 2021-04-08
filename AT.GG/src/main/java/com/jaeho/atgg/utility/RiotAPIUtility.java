package com.jaeho.atgg.utility;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.http.converter.json.GsonFactoryBean;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jaeho.atgg.domain.SummonerVO;
import com.jaeho.atgg.mapper.SummonerMapper;

import lombok.Setter;
import okhttp3.ConnectionPool;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

// DB에 내용이 있는지 검사하고 없다면 restAPI를 사용해서 DB에 저장할 수 있게 로직 구성
public class RiotAPIUtility {

	// 커넥션 Pool
	private static ConnectionPool connectionPool = new ConnectionPool();

	// Riot API
	private final static String API_KEY = "RGAPI-49865ff4-e5be-4ceb-947b-ed7d73e46c0e";

	// API EndPoint
	private final static String SUMMONER_BY_NAME = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/";

	// 소환사 정보 가져오기
	public static SummonerVO getSummonerByName(SummonerMapper summonerMapper, String summonerName) throws IOException {

		System.out.println(summonerMapper);

		// 데이터가 없다면
		if (summonerMapper.checkSummonerName(summonerName) == null) {

			OkHttpClient client = new OkHttpClient.Builder().connectionPool(connectionPool).build();
			Gson gson = new Gson();

			Request request = new Request.Builder().url(SUMMONER_BY_NAME + summonerName)
					.addHeader("X-Riot-Token", API_KEY).build();

			String result = syncGetResponse(client, request);

			if (!result.equals("404")) {
				SummonerVO summoner = gson.fromJson(result, SummonerVO.class);
				summonerMapper.insertSummoner(summoner);
				return summoner;
			} else {
				return null;
			}

			// 데이터가 있다면
		} else {
			return summonerMapper.getSummonerByName(summonerName);
		}
	}

	// 동기식 응답 요청
	private static String syncGetResponse(OkHttpClient client, Request request) throws IOException {

		try (Response response = client.newCall(request).execute()) {
			if (response.isSuccessful()) {
				return response.body().string();
			}
		} catch (Exception e) {
			System.out.println("동기식 응답 요청 에러 : " + e.getMessage());
		}
		return "404";
	}
}
