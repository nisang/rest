package com.che.common.pojo;

import java.io.Serializable;

import lombok.Data;

@Data
public class ReplyVo implements Serializable{

	private static final long serialVersionUID = -7379283156265286745L;

	private boolean success;	//返回是否成功
	private String msg;			//返回信息
	 
}