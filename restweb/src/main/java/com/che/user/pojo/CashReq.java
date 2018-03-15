package com.che.user.pojo;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class CashReq {
	
	/** 提现金额 */
	private BigDecimal money;
	
	private String timestamp;
	
	/**
	 * 加密字符串，规则如：md5(lower(timestamp+money))
	 * lower功能未小写
	 */
	private String encry;
	
}
