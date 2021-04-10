package com.jaeho.atgg.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LeagueEntryVO {

	String summonerName; // DB
	String queueType; // DB
	String tier; // DB
	String rank; // DB
	int leaguePoints; // DB
	int wins; // DB
	int losses; // DB
	MiniSeriesVO miniSeries;

}
