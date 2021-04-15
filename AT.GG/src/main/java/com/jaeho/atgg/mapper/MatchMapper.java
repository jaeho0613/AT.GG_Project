package com.jaeho.atgg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jaeho.atgg.domain.match.ParticipantStatsVO;
import com.jaeho.atgg.domain.match.ParticipantVO;
import com.jaeho.atgg.domain.match.TeamsVO;
import com.jaeho.atgg.domain.match.TimelineVO;
import com.jaeho.atgg.dto.MatchDTO;

public interface MatchMapper {

	// select
	public MatchDTO selectMatchRef(String gameId);

	public List<TeamsVO> selectTeams(String gameId);

	public List<ParticipantVO> selectParticipant(String gameId);

	public List<ParticipantStatsVO> selectParticipantStats(String gameId);

	public List<TimelineVO> selectTimeline(String gameId);

	public int totalMatchRefCount(String summonerName);

	// insert
	public void insertMatchRef(MatchDTO match);

	public void insertTeams(TeamsVO team);

	public void insertParticipant(ParticipantVO pp);

	public void insertParticipantStats(ParticipantStatsVO pps);

	public void insertTimeline(TimelineVO timeline);

	// pagsing
	public List<String> selectSummonerByMatchRef(@Param("summonerName") String summonerName,
			@Param("beginIndex") int beginIndex, @Param("endIndex") int endIndex);

}
