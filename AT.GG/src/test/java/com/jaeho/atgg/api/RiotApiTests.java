package com.jaeho.atgg.api;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.jaeho.atgg.domain.summoner.LeagueEntryVO;
import com.jaeho.atgg.dto.MatchDTO;
import com.jaeho.atgg.utility.RestAPIUtility;
import com.jaeho.atgg.utility.RiotAPIUtility;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RiotApiTests {

	// Riot API
	private String API_KEY = "RGAPI-18346a88-f665-4f60-8768-15981c2be879";

	// API EndPoint
	private String SUMMONER_BY_NAME = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/";
	private String LEAGUE_ENTRY = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/";

	private String MATCH_LIST = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/";

	@Test
	public void riotUtilityMatchList() throws IOException {

//		List<MatchDTO> result = RiotAPIUtility.getMatchInfo("0", "10");
//		result.forEach(re -> {
//			log.info("==========================");
//			log.info("게임 아이디");
//			log.info(re.getGameId());
//			log.info("게임 종류");
//			log.info(re.getQueueId());
//			log.info("게임 시작 시간");
//			log.info(re.getGameCreation());
//			log.info("총 게임 시간");
//			log.info(re.getGameDuration());
//			log.info("팀 정보");
//			re.getTeams().forEach(team -> {
//				log.info(team);
//			});
//			log.info("소환사 기본 정보");
//			re.getParticipants().forEach(participant -> {
//				log.info(participant);
//			});
//			log.info("게임 참여자 정보");
//			re.getParticipantIdentities().forEach(identities -> {
//				log.info(identities);
//			});
//			log.info("==========================");
//		});
	}

//	@Test
	public void asyncTest() throws IOException {
		Map<String, String> headers = new HashMap<String, String>();
		Map<String, String> parameters = new HashMap<String, String>();

		headers.put("X-Riot-Token", API_KEY);
		parameters.put("beginIndex", "0");
		parameters.put("endIndex", "10");

		RiotAPIUtility.asyncRestAPI(MATCH_LIST + "hBa-uU7svutxIZjKwLDATntUBaDaqoG3yHJxe-PDqpoB", headers, parameters);
	}

//	@Test
	public void getMatchList() throws IOException {

		Map<String, String> headers = new HashMap<String, String>();
		Map<String, String> parameters = new HashMap<String, String>();

		headers.put("X-Riot-Token", API_KEY);
		parameters.put("beginIndex", "0");
		parameters.put("endIndex", "100");

		String result = RiotAPIUtility.syncRestAPI(MATCH_LIST + "hBa-uU7svutxIZjKwLDATntUBaDaqoG3yHJxe-PDqpoB", headers,
				parameters);

		JsonArray matchList = new JsonParser().parse(result).getAsJsonObject().getAsJsonArray("matches");

		for (int i = 0; i < matchList.size(); i++) {
			String gameId = matchList.get(i).getAsJsonObject().get("gameId").getAsString();
			log.info(gameId);
		}
	}

//	@Test
	public void getLeague() throws IOException {

		// 승급전 있다 : Aug6rL4aWTg1YI9CkoLNDy2DTn9hL1SWp0-GL2abNX3FB-U
		// 승급전 없다 : X6kFsb4E1aQ4FipO4Td1_-0ErEfEkARATeJ97OLk22bLhw
		// 언랭크 : TGrRrLdvNSA4aEj7mnFvtcjYUTO0xhPhtDzTYrg9aZEsVkk

		// log.info();
		// 소환사 티어 정보 http 통신
		String leagueEntryResult = RestAPIUtility.syncRestAPI(
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
			if (leagueEntryVO.getMiniSeries() != null) {
				log.info("승급전이 있습니다.");
				// leagueEntryVO.getMiniSeries().setName(leagueEntryVO.getSummonerName());
			} else {
				log.info("승급전이 없습니다.");
			}
			log.info(leagueEntryVO);
		}
		log.info("==================");
	}
}
