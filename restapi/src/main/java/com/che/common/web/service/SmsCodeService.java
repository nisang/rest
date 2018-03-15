package com.che.common.web.service;

import com.che.common.pojo.ReplyVo;
import com.che.user.entity.ValidateEntity;

/**
 * @Description: 验证码
 * @author wangyanlong
 * @date 2015-12-10
 */
public interface SmsCodeService {

	/**
	 * 保存验证码
	 */
	public void saveValidateCode(ValidateEntity vate);

	/**
	 * 删除验证码
	 */
	public void deleteValidateCode(String phone);

	/**
	 * 查询验证码
	 */
	public ValidateEntity findValidateCodeByPhone(String phone);
	
	/**
	 * 获取验证码
	 * @return
	 */
	public String getSmsToken();
	
	/**
	 * 发送短信验证码
	 * @param mobile
	 * @param content
	 * @param source
	 * @param ip
	 * @param token
	 * @return
	 */
	public ReplyVo sendMsg(String mobile, String content, Integer source, String ip, String token);
	
	public Boolean validateToken(String token);
}
