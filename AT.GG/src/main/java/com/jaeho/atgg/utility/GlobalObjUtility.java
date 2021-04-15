package com.jaeho.atgg.utility;

import java.util.Set;

import org.springframework.stereotype.Component;

import java.util.Map.Entry;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.log4j.Log4j;

@Log4j
public class GlobalObjUtility {

	private static JsonObject championJson = null;

	public String getChampionByName(String key) {
		if (championJson == null) {
			initChampionJson();
		}
		return championJson.get(key).getAsString();
	}

	private void initChampionJson() {
		try {
			JsonObject championJson = new JsonObject();
			String result = RestAPIUtility
					.syncRestAPI("http://ddragon.leagueoflegends.com/cdn/11.8.1/data/ko_KR/champion.json");

			JsonObject jsonObj = (JsonObject) new JsonParser().parse(result);
			jsonObj = jsonObj.get("data").getAsJsonObject();

			Set<Entry<String, JsonElement>> entrySet = jsonObj.entrySet();

			for (Entry<String, JsonElement> entry : entrySet) {
				championJson.addProperty(entry.getValue().getAsJsonObject().get("key").getAsString(), entry.getKey());
			}

//			log.info(championJson);

			this.championJson = championJson;

		} catch (Exception e) {
			log.error("챔피언 데이터 초기화 오류 !!!");
		}
	}
}
