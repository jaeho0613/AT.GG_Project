package com.jaeho.atgg.mapper;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.Gson;
import com.jaeho.atgg.domain.match.MatchReferenceVO;
import com.jaeho.atgg.domain.summoner.SummonerVO;
import com.jaeho.atgg.utility.RestAPIUtility;
import com.jaeho.atgg.utility.RiotAPIUtility;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MatchMapperTests {
	
	// Riot API
	private String API_KEY = "RGAPI-c48dd79b-65ed-4941-87be-d97a8e2b5a14";

	// API EndPoint
	private String SUMMONER_BY_NAME = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/";
	private String LEAGUE_ENTRY = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/";

	private String MATCH_LIST = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/";

	@Setter(onMethod_ = @Autowired)
	private MatchMapper mapper;
	
//	@Test
	public void getMatchReferenceList() {
		
//		List<MatchReferenceVO> matchList
		
	}
	
	@Test
	public void insertMatchList() throws IOException {

		Map<String, String> headers = new HashMap<String, String>() {
			{
				put("X-Riot-Token", API_KEY);
			}
		};

		Map<String, String> parameters = new HashMap<String, String>() {
			{
				put("beginIndex", "0");
				put("endIndex", "10");
			}
		};

		String matchResult = RestAPIUtility.restAPI(MATCH_LIST + "hBa-uU7svutxIZjKwLDATntUBaDaqoG3yHJxe-PDqpoB",
				headers, parameters);
//		log.info(matchResult);
		MatchReferenceVO matches = new Gson().fromJson(matchResult, MatchReferenceVO.class);
		matches.getMatches().forEach(match -> {
			match.setName("정재호임");
			log.info(match);
			mapper.insertMatchList(match);
		});

	}

}
