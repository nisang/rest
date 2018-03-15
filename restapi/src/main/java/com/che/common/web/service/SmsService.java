package com.che.common.web.service;

/**
 * 发送短信服务
 *  
 * @author <font color='blue'>zhoufy</font>
 * @version 1.0
 * @date 2016-6-15  
 */
public interface SmsService {

	/**
	 * 发送短信 （记录ip）
	 * @param mobile
	 * @param smsContent
	 * @param source
	 * @param ip
	 */
	public boolean sendMsg(String mobile, String smsContent, Integer source, String ip);
	
	/**
	 * 判断同一个手机号码1个小时内发送是否超过1定里
	 * @param mobile
	 */
	public boolean isSendOverNum(String mobile);
}
