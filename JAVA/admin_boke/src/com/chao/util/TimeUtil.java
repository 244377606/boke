package com.chao.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {

	public static String createTime(){
		
		 Date date = new Date();
		 String time = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date);
		 return time;
	}
}
