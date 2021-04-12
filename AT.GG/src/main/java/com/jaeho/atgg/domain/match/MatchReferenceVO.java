package com.jaeho.atgg.domain.match;

import java.util.List;

import lombok.Data;

@Data
public class MatchReferenceVO {
	
	@Data
	public class Matches {
		String name;
		long gameId;
		long timestamp;
		String role;
		String lane;
		int champion;
		int queue;
	}

	List<Matches> matches;
}
