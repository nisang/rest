package com.che.common.entity;

import java.io.Serializable;

import lombok.Data;

@Data
public class Brand implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8029032920571090266L;

	private Long id;
	
	private String name;
	
	private String num;
	
	private String pic;

}
