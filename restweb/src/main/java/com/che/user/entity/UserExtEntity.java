package com.che.user.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserExtEntity implements Serializable{

	private static final long serialVersionUID = -102436873437565694L;
	private Long uid; // 用户id
	private Double remain_quota;
	private Double quota;
	
	private Timestamp create_time;//'创建时间',
	private Timestamp update_time;//'更新时间',

}