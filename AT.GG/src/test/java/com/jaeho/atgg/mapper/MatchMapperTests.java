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
	@Transactional
	public void MatchRefInsert() throws IOException {

		List<String> gameIdList = RiotAPIUtility.getMatchList("0", "1");

		for (int i = 0; i < gameIdList.size(); i++) {

			// 게임 리스트 불러오기
			String result = RestAPIUtility.asyncRestAPI(MATCH_INFO + gameIdList.get(i), new HashMap<String, String>() {
				{
					put("X-Riot-Token", API_KEY);
				}
			});

			MatchDTO match = new Gson().fromJson(result, MatchDTO.class);
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
				log.info(team);
			});
			log.info("소환사 기본 정보 : getParticipants");
			match.getParticipants().forEach(participant -> {
				log.info(participant);
			});
			log.info("게임 참여자 정보 : getParticipantIdentities");
			match.getParticipantIdentities().forEach(identities -> {
				log.info(identities);
			});
			log.info("==========================");

//			List<TeamsVO> teams = match.getTeams();
//			for (TeamsVO team : teams) {
//				mapper.insertTeams(team);
//			}
//			
//			List<ParticipantVO> participants = match.getParticipants();
//			for (ParticipantVO pp : participants) {
//				mapper.insertParticipant(pp);
//				mapper.insertParticipantStats(pp.getStats());
//				mapper.insertTimeline(pp.getTimeline());
//			}
//
//			mapper.insertMatchRef(match);
		}
	}
}
