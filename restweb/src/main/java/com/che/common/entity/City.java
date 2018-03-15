package com.che.common.entity;

import java.io.Serializable;

import lombok.Data;

@Data
public class City implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8775408062081844831L;
	
	private Long id;//城市ID
	private String code;//高德城市code
	private String name;//城市名称
	
	private String num;//首字母
	
	private Long provinceId;//省份
	
	private String lng;
	private String lat;
	
	private int isopen;//是否提供服务，1开通，0不提供
	private int hot;//0 非热门，1热门
	
}
