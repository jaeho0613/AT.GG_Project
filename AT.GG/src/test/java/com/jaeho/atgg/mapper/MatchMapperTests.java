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
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.jaeho.atgg.domain.match.ParticipantIdentitiesVO;
import com.jaeho.atgg.domain.match.ParticipantStatsVO;
import com.jaeho.atgg.domain.match.ParticipantVO;
import com.jaeho.atgg.domain.match.TeamsVO;
import com.jaeho.atgg.domain.match.TimelineVO;
import com.jaeho.atgg.domain.summoner.SummonerVO;
import com.jaeho.atgg.dto.MatchDTO;
import com.jaeho.atgg.service.MatchService;
import com.jaeho.atgg.utility.RestAPIUtility;
import com.jaeho.atgg.utility.RiotAPIUtility;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MatchMapperTests {

	// Riot API
	private String API_KEY = "RGAPI-e55c9559-659d-424d-8f54-d685fb38ded7";

	// API EndPoint
	private String MATCH_LIST = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/";
	private String MATCH_INFO = "https://kr.api.riotgames.com/lol/match/v4/matches/";

	@Setter(onMethod_ = @Autowired)
	private MatchMapper mapper;

	@Test
	public void selectMatchPagsing() {
		List<ParticipantVO> matchs = mapper.selectPaging("정재호임", 0, 3);

		matchs.forEach(match -> log.info(match));
	}

//	@Test
	public void totalCount() {
//		log.info(mapper.totalMatchRefCount());
	}

//	@Test
	public void MatchMapperSelect() {

		log.info(mapper.selectMatchRef("5120307891"));
		log.info(mapper.selectParticipant("5120307891"));
		log.info(mapper.selectParticipantStats("5120307891"));
		log.info(mapper.selectTeams("5120307891"));
		log.info(mapper.selectTimeline("5120307891"));
	}
}
