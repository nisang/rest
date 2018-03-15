package com.che.common.web.service;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.Data;

/**
 * 短信下发日志
 * @author zhoufy
 * @date 2016-5-17
 */
@Data
public class SmsSendLog implements Serializable {
	
	private static final long serialVersionUID = -7604287845184130789L;
	
	private Integer id;				//主键ID
	private String mobile;			//手机号码
	private String smsContent;		//短信内容
	private Timestamp addTime;			//添加时间
	private int source;				//来源：0:PC端，1：M站，2：ios，3：android'
	private String isSuccess;		//是否成功：success、fail
	private String remark;			//备注
	 
}