package com.che.common.entity;

import lombok.Data;

@Data
public class AirportRailway {

	private int id;
	private int cityId;
	private String cityName;
	private String name;
	private String lat;
	private String lng;
	private int type;
}
