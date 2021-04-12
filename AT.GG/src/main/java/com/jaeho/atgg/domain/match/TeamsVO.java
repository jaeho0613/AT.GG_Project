package com.jaeho.atgg.domain.match;

import lombok.Data;

@Data
public class TeamsVO {
	long gameId;
	int towerKills;
	int dragonKills;
	int baronKills;
	int teamId;
	String win;
}
