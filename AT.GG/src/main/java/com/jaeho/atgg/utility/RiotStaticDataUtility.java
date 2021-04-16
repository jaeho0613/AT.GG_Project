package com.jaeho.atgg.utility;

import java.util.Set;

import org.springframework.stereotype.Component;

import java.util.Map.Entry;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.log4j.Log4j;

@Log4j
public class RiotStaticDataUtility {

	private JsonObject championJson = null;
	private JsonObject summonerSpellJson = null;
	private JsonObject queueJson = null;

	public RiotStaticDataUtility() {
		if (championJson == null) {
			initChampionJson();
		}
		if (summonerSpellJson == null) {
			initSpellJson();
		}
		if (queueJson == null) {
			initQueueJson();
		}
	}

	public String getChampionByName(String key) {
		return championJson.get(key).getAsString();
	}

	public String getSpellByName(String key) {
		return summonerSpellJson.get(key).getAsString();
	}

	public String getQueueByName(String key) {
		if (queueJson.get(key) != null) {
			return queueJson.get(key).getAsString();
		} else {
			return "이벤트맵";
		}
	}

	private void initQueueJson() {
		queueJson = new JsonObject();
		queueJson.addProperty("450", "칼바람 나락");
		queueJson.addProperty("440", "자유 랭크");
		queueJson.addProperty("430", "일반");
		queueJson.addProperty("420", "솔로 랭크");
	}

	// 소환사 스펠 json 초기화 변수
	private void initSpellJson() {
		summonerSpellJson = initStaticRiotJson(
				"http://ddragon.leagueoflegends.com/cdn/11.8.1/data/en_US/summoner.json");
	}

	// 챔피언 json 초기화 변수
	private void initChampionJson() {
		championJson = initStaticRiotJson("http://ddragon.leagueoflegends.com/cdn/11.8.1/data/en_US/champion.json");
	}

	// 라이엇 정적 데이터 파싱 변수
	private JsonObject initStaticRiotJson(String url) {
		try {
			JsonObject resultJson = new JsonObject();
			String result = RestAPIUtility.syncRestAPI(url);

			JsonObject jsonObj = (JsonObject) new JsonParser().parse(result);
			jsonObj = jsonObj.get("data").getAsJsonObject();

			Set<Entry<String, JsonElement>> entrySet = jsonObj.entrySet();

			for (Entry<String, JsonElement> entry : entrySet) {
				resultJson.addProperty(entry.getValue().getAsJsonObject().get("key").getAsString(), entry.getKey());
			}

			log.info(resultJson);

			return resultJson;

		} catch (Exception e) {
			log.error("라이엇 정적 데이터 초기화 오류 !!!");
			return null;
		}
	}

}
