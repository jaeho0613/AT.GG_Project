package com.jaeho.atgg.service;

import com.jaeho.atgg.domain.LeagueEntryVO;
import com.jaeho.atgg.domain.SummonerVO;

public interface SummonerService {
	
	// 소환사 아이디 얻기
	public SummonerVO getSummonerInfo(String summonerName);
	
	// 소환사 정보 추가
	public void insertSummonerInfo(SummonerVO summoner);
	
	public void insertLeagueInfo(LeagueEntryVO leagueEntry);
	
	// DB 중복 체크
	public boolean isDuplicateDateCheck(String summonerName);

}
