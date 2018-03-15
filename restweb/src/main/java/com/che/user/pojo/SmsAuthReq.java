package com.che.user.pojo;

import lombok.Data;

@Data
public class SmsAuthReq {
	
	private String mobile;//手机号码
	private String smsCode;//短信验证码

}
