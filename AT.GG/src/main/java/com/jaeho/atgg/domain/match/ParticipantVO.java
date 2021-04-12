package com.jaeho.atgg.domain.match;

import lombok.Data;

@Data
public class ParticipantVO {
	String summoner;
	long gameId;
	int participantId;
	int championId;
	int teamId;
	int spell1Id;
	int spell2Id;
	ParticipantStatsVO stats;
}