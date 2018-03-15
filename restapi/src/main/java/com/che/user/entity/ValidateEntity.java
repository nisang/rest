package com.che.user.entity;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

@Data
public class ValidateEntity implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long Id;
	private Long type;
	private Date addtime;
	private Long userid;
	private String destination;			//手机号或者 邮箱
	private String code;		//验证码
	private String source; //操作来源 0：PC端，1：M站，2：ios，3：android';4:估价app
	
}
