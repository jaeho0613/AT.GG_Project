package com.jaeho.atgg.api;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.sound.midi.MidiDevice.Info;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fasterxml.jackson.core.JsonParser;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.stream.JsonReader;
import com.jaeho.atgg.domain.LeagueEntryVO;
import com.jaeho.atgg.domain.SummonerVO;
import com.jaeho.atgg.mapper.SummonerMapper;
import com.jaeho.atgg.service.SummonerService;
import com.jaeho.atgg.service.SummonerServiceImpl;
import com.jaeho.atgg.utility.RestAPIUtility;
import com.jaeho.atgg.utility.RiotAPIUtility;
import com.mysql.cj.xdevapi.Client;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import okhttp3.Call;
import okhttp3.HttpUrl;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RiotApiTests {

	@Setter(onMethod_ = @Autowired)
	SummonerService summonerService;
	// SummonerMapper summonerMapper;

	// 커넥션 Pool
	// private static ConnectionPool connectionPool = new ConnectionPool();

	// Riot API
	private String API_KEY = "RGAPI-09e5a48d-9f5d-4552-83af-67a2358a866a";

	// API EndPoint
	private String SUMMONER_BY_NAME = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/";
	private String LEAGUE_ENTRY = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/";
	
//	@Test
	public void check() {
		log.info(summonerService);
	}

//	@Test
//	public void getSummoner() throws IOException {
//
//		log.info(RiotAPIUtility.getSummonerByName(summonerService, "정재호임"));
//	}

	@Test
	public void getLeague() throws IOException {
		
		// 승급전 있다 : Aug6rL4aWTg1YI9CkoLNDy2DTn9hL1SWp0-GL2abNX3FB-U
		// 승급전 없다 : X6kFsb4E1aQ4FipO4Td1_-0ErEfEkARATeJ97OLk22bLhw
		// 언랭크 : TGrRrLdvNSA4aEj7mnFvtcjYUTO0xhPhtDzTYrg9aZEsVkk
		
		// log.info();
		// 소환사 티어 정보 http 통신
		String leagueEntryResult = RestAPIUtility.restAPI(
				LEAGUE_ENTRY + "X6kFsb4E1aQ4FipO4Td1_-0ErEfEkARATeJ97OLk22bLhw", new HashMap<String, String>() {
					{
						put("X-Riot-Token", API_KEY);
					}
				});
		log.info(leagueEntryResult);
		
		LeagueEntryVO[] leagues = new Gson().fromJson(leagueEntryResult, LeagueEntryVO[].class);

		log.info("==================");
		// log.info(leagueEntryResult);
		for (LeagueEntryVO leagueEntryVO : leagues) {
			if(leagueEntryVO.getMiniSeries() != null) {
				log.info("승급전이 있습니다.");
				leagueEntryVO.getMiniSeries().setName(leagueEntryVO.getSummonerName());
			} else {
				log.info("승급전이 없습니다.");
			}
			log.info(leagueEntryVO);
		}
		log.info("==================");
	}
}