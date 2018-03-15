package com.che.common.web.service;

import com.che.common.pojo.ReplyVo;

public interface SmsVoService {

	/**
	 * 获取短信验证码的token值
	 */
	public String getSmsToken();

	/**
	 * 验证token
	 */
	public boolean validateToken(String token);

	/**
	 * 发送短信 （记录ip）
	 * 
	 * @param mobile
	 *            手机号码 (必须值)
	 * @param smsContent
	 *            短信内容 (必须值)
	 * @param source
	 *            渠道 (必须值)
	 * @param ip
	 *            ip
	 * @param token
	 *            token (必须值)
	 */
	public ReplyVo sendMsg(String mobile, String smsContent, Integer source, String ip, String token);

	/**
	 * 发送短信 （内部 服务发送短信使用 不需要使用token验证）
	 * 
	 * @param mobile
	 *            手机号码 (必须值)
	 * @param smsContent
	 *            短信内容 (必须值)
	 * @param source
	 *            渠道 (必须值)
	 * @param ip
	 *            ip
	 * @param token
	 *            token (必须值)
	 */
	public ReplyVo sendMobileMessage(String mobile, String smsContent, Integer source);
}
