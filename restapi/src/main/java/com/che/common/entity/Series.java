package com.che.common.entity;

import java.io.Serializable;

import lombok.Data;

@Data
public class Series implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long id;
	
	private String name;
	
	private String num;
}
