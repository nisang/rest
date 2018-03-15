package com.che.user.pojo;

import lombok.Data;

@Data
public class FriendRepEntity {
	
	/** 电话 */
	private String mobile;
	/** 传值   */
	private String contactName;
	
	private Long uid;
	
	/** 注册时的用户名称 */
	private String userName;
	
	private int publicCarTotal;
	
	private String avatar;
	
	/** 1:已注册  0:未注册*/
	private int reg = 1;
	private boolean register = true;

}
