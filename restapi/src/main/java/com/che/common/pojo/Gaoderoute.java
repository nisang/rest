package com.che.common.pojo;

import java.util.List;

import lombok.Data;

@Data
public class Gaoderoute {
	
	private String origin;
	private String destination;
	private List<GaoderoutePath> paths;
	
	

}
