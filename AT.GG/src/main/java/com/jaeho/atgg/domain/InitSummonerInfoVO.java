package com.jaeho.atgg.domain;

import java.util.List;

import lombok.Data;

@Data
public class InitSummonerInfoVO {

	private List<MiniSeriesVO> miniSeriesVO;
	private List<LeagueEntryVO> leagueEntryVO;
	private SummonerVO summonerVO;
	
}
