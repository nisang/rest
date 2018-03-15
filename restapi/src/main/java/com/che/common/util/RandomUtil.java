package com.che.common.util;

import java.security.SecureRandom;

import org.apache.http.impl.execchain.MainClientExec;
import org.apache.log4j.chainsaw.Main;

public class RandomUtil {
	
	/**
	 * 生成6位数验证码或密码
	 */
	public static int setRandom() {
		// 随机生成6位数字密码
		SecureRandom oRandom = new SecureRandom();
		int text = oRandom.nextInt(999999);

		while (text < 100000) {
			text = text * 10;
		}
		return text;
	}

	/**
	 * 生成8位数验证码或密码
	 */
	public static int setRandom8() {
		// 随机生成6位数字密码
		SecureRandom oRandom = new SecureRandom();
		int text = oRandom.nextInt(99999999);

		while (text < 10000000) {
			text = text * 10;
		}
		return text;
	}

}
