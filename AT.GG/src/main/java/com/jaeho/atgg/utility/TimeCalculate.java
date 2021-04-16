package com.jaeho.atgg.utility;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeCalculate {

	// timestamp to Date (String)
	public static String createTimeByDateToString(long time) {

		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");

		return sdf.format(new Date(time));
	}

	public static String durationTimeByDateToString(long time) {
		String min = Integer.toString((int) (time / 60));
		String seccond = Integer.toString((int) (time % 60));
		
		return min + "분 " + seccond + "초";
	}
}
