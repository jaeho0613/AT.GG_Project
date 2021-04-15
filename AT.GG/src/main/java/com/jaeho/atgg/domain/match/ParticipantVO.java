package com.jaeho.atgg.domain.match;

import lombok.Data;

// 소환사 '1명'의 공통 정보
@Data
public class ParticipantVO {
	String summoner; // 소환사 이름
	String gameId; // 게임 아이디
	int participantId; // 픽순
	int championId; // 선택 챔피언
	int teamId; // 팀 
	int spell1Id; // 스펠
	int spell2Id;
	ParticipantStatsVO stats; // 참여한 소환사 세부 정보
	TimelineVO timeline; // 참여한 소환사 라인 정보

}