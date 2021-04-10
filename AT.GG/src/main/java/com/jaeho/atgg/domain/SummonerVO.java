package com.jaeho.atgg.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SummonerVO {

	private String id; // DB
	private String accountId; // DB
	private String puuid; // DB
	private String name; // DB
	private String profileIconId; // DB
	private String revisionDate; // DB
	private String summonerLevel; // DB
	
}
