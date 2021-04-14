package com.jaeho.atgg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jaeho.atgg.domain.match.ParticipantIdentitiesVO;
import com.jaeho.atgg.domain.match.ParticipantStatsVO;
import com.jaeho.atgg.domain.match.ParticipantVO;
import com.jaeho.atgg.domain.match.TeamsVO;
import com.jaeho.atgg.domain.match.TimelineVO;
import com.jaeho.atgg.dto.MatchDTO;
import com.jaeho.atgg.mapper.MatchMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MatchServiceImpl implements MatchService {

	@Setter(onMethod_ = @Autowired)
	private MatchMapper mapper;

	@Override
	@Transactional
	public void insertMatchRef(MatchDTO match) {
		log.info("==============================");
		log.info("insertMatchRef - Database 접근");
		log.info(match);
		log.info("==============================");

		mapper.insertMatchRef(match);

		List<TeamsVO> teams = match.getTeams();
		for (TeamsVO team : teams) {
			mapper.insertTeams(team);
		}

		List<ParticipantVO> participants = match.getParticipants();
		for (ParticipantVO pp : participants) {
			mapper.insertParticipant(pp);
			mapper.insertParticipantStats(pp.getStats());
			mapper.insertTimeline(pp.getTimeline());
		}
	}

	@Override
	@Transactional
	public MatchDTO selectMatchRef(String gameId) {
		log.info("==============================");
		log.info("selectMatchRef - Database 접근");
		log.info(gameId);
		log.info("==============================");

		MatchDTO match = mapper.selectMatchRef(gameId);

		List<TeamsVO> teams = mapper.selectTeams(gameId);
		List<TimelineVO> timeline = mapper.selectTimeline(gameId);
		List<ParticipantVO> participants = mapper.selectParticipant(gameId);
		List<ParticipantStatsVO> participantStats = mapper.selectParticipantStats(gameId);

		for (int i = 0; i < participants.size(); i++) {
			participants.get(i).setStats(participantStats.get(i));
			participants.get(i).setTimeline(timeline.get(i));
		}

		match.setParticipants(participants);
		match.setTeams(teams);

		return match;
	}

	@Override
	public boolean isDuplicateDateCheck(String gameId) {
		log.info("==============================");
		log.info("isDuplicateDateCheck - Database 접근");
		log.info(gameId);
		log.info("==============================");

		if (mapper.selectMatchRef(gameId) != null) {
			return true;
		} else {
			return false;
		}
	}
}
