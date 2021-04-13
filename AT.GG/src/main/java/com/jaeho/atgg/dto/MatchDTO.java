package com.jaeho.atgg.dto;

import java.util.List;

import com.jaeho.atgg.domain.match.ParticipantIdentitiesVO;
import com.jaeho.atgg.domain.match.ParticipantVO;
import com.jaeho.atgg.domain.match.TeamsVO;

public class MatchDTO {
	String gameId;
	long gameCreation;
	long gameDuration;
	int queueId;
	TeamsVO teams;
	List<ParticipantVO> participants;
	List<ParticipantIdentitiesVO> participantIdentities; // 매칭에 참여한 소환사 명단
}
