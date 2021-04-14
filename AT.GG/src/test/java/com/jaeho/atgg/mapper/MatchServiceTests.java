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
public class MatchServiceTests {

	// Riot API
	private String API_KEY = "RGAPI-e55c9559-659d-424d-8f54-d685fb38ded7";

	// API EndPoint
	private String MATCH_LIST = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/";
	private String MATCH_INFO = "https://kr.api.riotgames.com/lol/match/v4/matches/";

	@Setter(onMethod_ = @Autowired)
	private MatchService service;

//	@Test
	public void MatchRefInsert() throws IOException {

		RiotAPIUtility.initMatchInfo(service, "0", "5");
	}

	@Test
	public void MatchSelect() {
		MatchDTO match = service.selectMatchRef("5120527754");
		
		log.info("==========================");
		log.info("게임 아이디 : getGameId");
		log.info(match.getGameId());

		log.info("게임 종류 : getQueueId");
		log.info(match.getQueueId());

		log.info("게임 시작 시간 : getGameCreation");
		log.info(match.getGameCreation());

		log.info("총 게임 시간 : getGameDuration");
		log.info(match.getGameDuration());

		log.info("팀 정보 : getTeams");
		match.getTeams().forEach(team -> {
			team.setGameId(match.getGameId());
			log.info(team);
		});
		
		log.info("소환사 기본 정보 : getParticipants");
		match.getParticipants().forEach(participant -> {
			log.info(participant);
		});

		log.info("==========================");

	}
}