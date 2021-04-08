package com.jaeho.atgg.service;

import com.jaeho.atgg.domain.SummonerVO;

public interface ISummonerService {
	
	public SummonerVO getSummoner(String summonerName);
	
	public void insertSummoner(SummonerVO summoner);
	
	public boolean isDuplicateDateCheck(String summonerName);

}
