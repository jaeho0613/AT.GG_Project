package com.jaeho.atgg.ms;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
import com.jaeho.atgg.service.SummonerService;
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
	private MatchService matchService;

	@Setter(onMethod_ = @Autowired)
	private SummonerService summonerService;

	@Test
	public void timeCalculate() throws IOException {

		String matchInfos = RestAPIUtility
				.syncRestAPI("http://localhost:8080/lol/matchs/" + "정재호임" + "?pageNum=" + "0");

		MatchDTO[] matchs = new Gson().fromJson(matchInfos, MatchDTO[].class);

		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");

		Date gameCreate = new Date(matchs[0].getGameCreation());
		int min = (int) ((matchs[0].getGameDuration()) / 60);
		int seccond = (int) ((matchs[0].getGameDuration()) % 60);
		
		log.info("매칭 날짜 : "+ sdf.format(gameCreate));
		log.info("게임 시간 : "+ min + ":" + seccond);
		
//		long difftime = currentTime.getTime() - gameCreate.getTime();

//		difftime = Math.abs(difftime / (24 * 60 * 60 * 1000));

//		long seconds = difftime / 1000;
//		long minutes = seconds / 60;
//		long hours = minutes / 60;
//		long days = hours / 24;

//		Timestamp diffTime = new Timestamp(difftime);

//		log.info("diff: " + difftime);
//		log.info("seconds: " + seconds);
//		log.info("minutes: " + minutes);
//		log.info("hours: " + hours);
//		log.info("days: " + days);

	}

//	@Test
	public void MatchRefList() {
		List<MatchDTO> matchList = matchService.selectMatchByPagsing("정재호임", 0, 5);

		matchList.forEach(match -> log.info(match));
	}

//	@Test
	public void MatchRefInsert() throws IOException {

		String accountId = summonerService.getSummonerAccountId("정재호임");

//		RiotAPIUtility.initMatchInfo(matchService, accountId, "0", "5");
	}

//	@Test
	public void MatchSelect() {
		MatchDTO match = matchService.selectMatchRef("5120527754");

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
