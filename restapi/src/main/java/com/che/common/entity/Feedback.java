package com.che.common.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Feedback implements Serializable{
	
	private static final long serialVersionUID = -3354806033386821571L;
	private Long id;
	private Long uid;
	private String phone;
	private String content;
	
	private String imageurl;
	private Timestamp create_time;
	

}
