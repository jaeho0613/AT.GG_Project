package com.jaeho.atgg.domain.match;

import lombok.Data;

// 소환사 '1명'의 공통 정보
@Data
public class ParticipantVO {
	String summoner;
	String gameId;
	int participantId;
	int championId;
	int teamId;
	int spell1Id;
	int spell2Id;
	ParticipantStatsVO stats; // 참여한 소환사 세부 정보
	TimelineVO timeline; // 참여한 소환사 라인 정보

}