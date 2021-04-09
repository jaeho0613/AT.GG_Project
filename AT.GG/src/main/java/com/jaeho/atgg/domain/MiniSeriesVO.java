package com.jaeho.atgg.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MiniSeriesVO {

	String name;
	int target;
	int wins;
	int losses;
	String progress;

}
