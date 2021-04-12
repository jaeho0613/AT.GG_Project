package com.jaeho.atgg.domain.summoner;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class MiniSeriesVO {

	String name; // DB
	int target; // DB
	int wins; // DB
	int losses; // DB
	String progress; // DB
	String type; // DB

}
