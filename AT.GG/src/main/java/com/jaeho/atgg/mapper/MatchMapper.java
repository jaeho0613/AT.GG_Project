package com.jaeho.atgg.mapper;

import com.jaeho.atgg.domain.match.ParticipantStatsVO;
import com.jaeho.atgg.domain.match.ParticipantVO;
import com.jaeho.atgg.domain.match.TeamsVO;
import com.jaeho.atgg.domain.match.TimelineVO;
import com.jaeho.atgg.dto.MatchDTO;

public interface MatchMapper {

	// insert
	public void insertMatchRef(MatchDTO match);

	public void insertTeams(TeamsVO team);

	public void insertParticipant(ParticipantVO pp);

	public void insertParticipantStats(ParticipantStatsVO pps);

	public void insertTimeline(TimelineVO timeline);

}
