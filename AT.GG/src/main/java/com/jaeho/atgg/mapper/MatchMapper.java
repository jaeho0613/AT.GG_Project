package com.jaeho.atgg.mapper;

import java.util.List;

import com.jaeho.atgg.domain.match.MatchReferenceVO;
import com.jaeho.atgg.domain.match.ParticipantStatsVO;
import com.jaeho.atgg.domain.match.ParticipantVO;
import com.jaeho.atgg.domain.match.TeamsVO;

public interface MatchMapper {

	public List<MatchReferenceVO> getMatchReferenceList(int beginIndex, int endIndex); // 게임 매칭 정보 리스트

	public List<TeamsVO> getTeamsList(long gameId); // 게임 매칭 팀 정보 리스트

	public List<ParticipantVO> getParticipantList(long gameId); // 게임 매칭 참여자 정보 리스트

	public List<ParticipantStatsVO> getParticipantStatsList(long gameId); // 게임 매칭 참여자 상세 정보 리스트
	
	public void insertMatchList(MatchReferenceVO.Matches match);

}
