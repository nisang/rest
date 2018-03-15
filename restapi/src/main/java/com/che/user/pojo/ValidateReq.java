package com.che.user.pojo;

import com.che.common.web.Req;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ValidateReq extends Req{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1798352956188331142L;

	private String mobile;//手机号
	private String time;//时间戳
	private String token;//随机数
	private String signature;
}
