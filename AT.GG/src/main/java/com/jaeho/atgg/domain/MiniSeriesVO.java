package com.jaeho.atgg.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MiniSeriesVO {

	String name; // DB
	int target; // DB
	int wins; // DB
	int losses; // DB
	String progress; // DB
	String type; // DB

}
