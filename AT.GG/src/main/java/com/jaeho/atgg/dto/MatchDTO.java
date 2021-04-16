package com.jaeho.atgg.dto;

import java.util.List;

import com.jaeho.atgg.domain.match.ParticipantIdentitiesVO;
import com.jaeho.atgg.domain.match.ParticipantVO;
import com.jaeho.atgg.domain.match.TeamsVO;

import lombok.Data;

@Data
public class MatchDTO {
	String gameId; // DB
	long gameCreation; // DB
	long gameDuration; // DB
	String queueId; // DB
	int participantId; // UI
	List<TeamsVO> teams; // DB
	List<ParticipantVO> participants; // DB
	List<ParticipantIdentitiesVO> participantIdentities; // DB 매칭에 참여한 소환사 명단 DB

	String createTimeString; // UI
	String durationTimeString; // UI
}
