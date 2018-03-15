package com.che.common.map;

import java.util.HashMap;
import java.util.Map;

public class VehicleMap {
	
	public static Map<Integer,String> vehicles = new HashMap<Integer,String>();
	
	static {
		vehicles.put(1, "经济型");
		vehicles.put(2, "舒适型");
		vehicles.put(3, "豪华型");
		vehicles.put(5, "商务型");
	}

}
