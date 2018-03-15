package com.che.common.constant;

import java.util.ArrayList;
import java.util.List;

public class Constant {
	/** 访问来源：PC **/
	public static final int SOURCE_PC = 0;
	/** 访问来源：M站 **/
	public static final int SOURCE_M = 1;
	/** 访问来源：车城IOS **/
	public static final int SOURCE_IOS = 2;
	/** 访问来源：车城Android **/
	public static final int SOURCE_ANDDROID = 3;
	/** 访问来源：车助手app **/
	public static final int SOURCE_CZS = 4;
	
	public static List<Integer> sourceList = new ArrayList<Integer>();
	static{
		sourceList.add(SOURCE_PC);
		sourceList.add(SOURCE_M);
		sourceList.add(SOURCE_IOS);
		sourceList.add(SOURCE_ANDDROID);
		sourceList.add(SOURCE_CZS);
	}
	
	/** 成功  **/
	public static final String SUCCESS = "success";
	/** 失败  **/
	public static final String FAIL = "fail";
    
	/**错误信息**/
	public static final String ERROR_MSG = "error_msg";
	/**正确信息**/
	public static final String SUCCESS_MSG = "success_msg";
	
	/** 支付成功  **/
	public static final String PAID_SUCCESS = "paid_success";
	/** 支付失败  **/
	public static final String PAID_FAIL = "paid_fail";
	/** 支付调用方法失败  **/
	public static final String PAID_CALL_FAIL = "paid_call_fail";
	
	public static final char[] randomChar = {'a','b','c','d','e','f','g','h','i','1', '2', '3','4','5','6','7'};
}
