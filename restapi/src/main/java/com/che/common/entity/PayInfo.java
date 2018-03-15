package com.che.common.entity;

public enum PayInfo {
	SYS_NAME("AICHE_GUJIA");
	
	private String name;

	private PayInfo(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
