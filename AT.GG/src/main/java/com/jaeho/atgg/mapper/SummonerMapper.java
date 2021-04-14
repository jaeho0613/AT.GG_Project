package com.jaeho.atgg.mapper;

import java.util.List;

import com.jaeho.atgg.domain.summoner.LeagueEntryVO;
import com.jaeho.atgg.domain.summoner.MiniSeriesVO;
import com.jaeho.atgg.domain.summoner.SummonerVO;

public interface SummonerMapper {

	// Get
	public SummonerVO getSummonerByName(String summonerName); // 소환사 정보 가져오기

	public List<LeagueEntryVO> getLeagueEntryList(String summonerName); // 소환사 티어 정보 가져오기

	public List<MiniSeriesVO> getMiniSeriesList(String summonerName); // 소환사 승급전 정보

	public String getSummonerByAccountId(String summonerName);

	// Insert
	public void insertSummoner(SummonerVO summoner); // 소환사 정보 입력

	public void insertLeagueEntry(LeagueEntryVO leagueEntry); // 소환사 티어 정보 입력

	public void insertMiniSeries(MiniSeriesVO miniSeries); // 소환사 승급전 정보 입력

	// Check
	public String checkSummonerName(String summonerName); // 소환사 아이디 중복 체크
}