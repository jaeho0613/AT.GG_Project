package com.jaeho.atgg.domain.match;

import lombok.Data;

//소환사 '1명'의 세부 정보
@Data
public class ParticipantStatsVO {
	String gameId;
	int champLevel; // 챔피언 레벨
	int participantId; // 픽순
	long totalDamageDealtToChampions; // 딜량
	int item0; // 아이템
	int item1;
	int item2;
	int item3;
	int item4;
	int item5;
	int largestMultiKill; // 멀티킬
	int goldEarned; // 획득 골드량
	int wardsKilled; // 와드 제거 수
	int wardsPlaced; // 총 와드 샤용 횟수 (핑와 포함)
	int totalMinionsKilled; // totalMinionsKilled + neutralMinionsKilled : cs 수
	int neutralMinionsKilled;
	int visionWardsBoughtInGame; // 핑크 와드 사용 횟수
	int kills; // 킬수
	int deaths; // 데스수
	int assists; // 어시수
	int perk0; // 선택 주 룬
	int perk1;
	int perk2;
	int perk3;
	int perk4;
	int perk5;
	int perkPrimaryStyle; // 주 룬 타이틀
	int perkSubStyle; // 보조 룬 타이틀
	int statPerk0; // 선택 보조 룬
	int statPerk1;
	int statPerk2;
	String win; // 승패 여부
}