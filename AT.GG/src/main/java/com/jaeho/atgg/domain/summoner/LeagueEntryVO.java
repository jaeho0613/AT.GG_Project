package com.jaeho.atgg.domain.summoner;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
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
