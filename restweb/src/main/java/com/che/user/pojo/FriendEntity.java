package com.che.user.pojo;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.container.Main;

import lombok.Data;

@Data
public class FriendEntity {
	
	/** 电话 */
	private String mobile;
	/** 用户名 */
	private String userName;
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		boolean flag = mobile.contains("-");
		mobile = flag?mobile.replace("-", ""):mobile;
		flag = mobile.contains(("+86"));
		mobile = flag?mobile.replace("+86", ""):mobile;
		flag = mobile.startsWith("86");
		mobile = flag?mobile.replace("86", ""):mobile;
		//红米node3特殊手机格式
		mobile = mobile.replace(" ", "");
		this.mobile = mobile.trim();
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

}
