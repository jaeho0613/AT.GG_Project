package com.jaeho.atgg.domain.match;

import lombok.Data;

@Data
public class ParticipantStatsVO {
	long gameId;
	long totalDamageDealtToChampions;
	int item0;
	int item1;
	int item2;
	int item3;
	int item4;
	int item5;
	int largestMultiKill;
	int goldEarned;
	int wardsKilled;
	int wardsPlaced;
	int totalMinionsKilled;
	int visionWardsBoughtInGame;
	int kills;
	int deaths;
	int assists;
	int neutralMinionsKilled;
	int perk0;
	int perk1;
	int perk2;
	int perk3;
	int perk4;
	int perk5;
	int perkPrimaryStyle;
	int perkSubStyle;
	int statPerk0;
	int statPerk1;
	int statPerk2;
	boolean win;
}
