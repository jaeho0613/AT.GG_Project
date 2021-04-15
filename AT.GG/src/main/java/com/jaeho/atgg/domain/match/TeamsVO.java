package com.jaeho.atgg.domain.match;

import lombok.Data;

@Data
public class TeamsVO {
	String gameId;
	int towerKills; // 타워킬
	int dragonKills; // 드레곤킬
	int baronKills; // 바론킬
	int teamId; // 팀
	String win; // 승리여부
}
