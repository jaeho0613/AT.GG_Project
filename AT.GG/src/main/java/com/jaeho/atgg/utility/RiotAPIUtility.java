package com.jaeho.atgg.utility;

import java.io.IOException;

import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.http.converter.json.GsonFactoryBean;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jaeho.atgg.domain.SummonerVO;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class RiotAPIUtility {

	private final static String API_KEY = "RGAPI-49865ff4-e5be-4ceb-947b-ed7d73e46c0e";

	private final static String SUMMONER_BY_NAME = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/";

	public static SummonerVO getSummonerByName(String summonerName) throws IOException {
		OkHttpClient client = new OkHttpClient();
		Gson gson = new Gson();

		Request request = new Request.Builder().url(SUMMONER_BY_NAME + summonerName).addHeader("X-Riot-Token", API_KEY)
				.build();
		String result = syncGetResponse(client, request);

		if (!result.equals("404")) {
			SummonerVO summoner = gson.fromJson(result, SummonerVO.class);
			return summoner;
		} else {
			return null;
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
