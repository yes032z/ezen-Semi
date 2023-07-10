package com.semi.common;

public class Utility {
	public static String cutString(String title, int len) {
		String result = "";
		if(title.length()>len) {
			result = title.substring(0,len)+ "...";
		}else {
			result = title;
		}

		return result;
	}

}












