package com.jaeho.atgg.domain.match;

import lombok.Data;

@Data
public class MatchReferenceVO {
	long gameId;
	long timestamp;
	String role;
	String lane;
	int champion;
	int queue;
}
