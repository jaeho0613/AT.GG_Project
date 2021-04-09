package com.jaeho.atgg.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SummonerVO {

	private String id;
	private String accountId;
	private String puuid;
	private String name;
	private String profileIconId;
	private String revisionDate;
	private String summonerLevel;

}
