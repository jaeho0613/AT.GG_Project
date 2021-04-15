package com.jaeho.atgg.service;

import java.util.List;

import com.jaeho.atgg.domain.match.ParticipantVO;
import com.jaeho.atgg.dto.MatchDTO;

public interface MatchService {

	// insert
	public void insertMatchRef(MatchDTO match);
	
	// select
	public MatchDTO selectMatchRef(String gameId);
	
	// 특정 소환사 match 총 갯수 
	public int totalMatchRefCount(String summonerName);
	
	// 특정 소환사 매칭 정보 페이징
	public List<MatchDTO> selectMatchByPagsing(String summonerName,int beginIndex, int endIndex);
	
	// check
	public boolean isDuplicateDateCheck(String gameId);

}
