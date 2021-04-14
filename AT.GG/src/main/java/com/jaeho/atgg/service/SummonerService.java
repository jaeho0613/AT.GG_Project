package com.jaeho.atgg.service;

import java.util.Map;

import com.jaeho.atgg.domain.summoner.LeagueEntryVO;
import com.jaeho.atgg.domain.summoner.MiniSeriesVO;
import com.jaeho.atgg.domain.summoner.SummonerVO;

public interface SummonerService {

	// 소환사 아이디 얻기
	public Map<String, Object> getSummonerInfoAll(String summonerName);
	
	// 소환사 AccountId 얻기
	public String getSummonerAccountId(String summonerName);

	// 소환사 정보 추가
	public void insertSummonerInfo(SummonerVO summoner);

	// 소환사 리그 정보 추가
	public void insertLeagueInfo(LeagueEntryVO leagueEntry);

	// 소환사 승급전 정보 추가
	public void insertMiniseries(MiniSeriesVO miniSeries);
	
	// DB 중복 체크
	public boolean isDuplicateDateCheck(String summonerName);

}
