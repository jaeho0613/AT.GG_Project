package com.jaeho.atgg.service;

import com.jaeho.atgg.dto.MatchDTO;

public interface MatchService {

	// insert
	public void insertMatchRef(MatchDTO match);
	
	// select
	public MatchDTO selectMatchRef(String gameId);
	
	// check
	public boolean isDuplicateDateCheck(String gameId);

}
