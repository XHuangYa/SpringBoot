package com.bakery.application.util;

import java.util.UUID;

public class UUIDUtil {
	public static String createKey() {
		return UUID.randomUUID().toString();
	}

	/**
	 * <p>Description: 创建32位的UUID</p>
	 */
	public static String create32Key() {
		return UUID.randomUUID().toString().replaceAll("\\-", "");
	}
	
	/**
	  * 创建指定数量的随机字符串
	  */
	public static int createRandom(int length) {
		String retStr = "";
		String strTableFirst = "123456789";
		String strTable = "1234567890";

		for (int i = 0; i < length; i++) {
			if (i == 0) {
				double dblR = Math.random() * 9;
				int intR = (int) Math.floor(dblR);
				retStr += strTableFirst.charAt(intR);
			} else {
				double dblR = Math.random() * 10;
				int intR = (int) Math.floor(dblR);
				retStr += strTable.charAt(intR);
			}
		}
		return Integer.parseInt(retStr);
	}
}
