package com.jaeho.atgg.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LeagueEntryVO {

	String summonerName;
	String queueType;
	String tier;
	String rank;
	int leaguePoints;
	int wins;
	int losses;
	MiniSeriesVO miniSeries;
	
}
