package com.che.common.map;

import java.util.HashMap;
import java.util.Map;

public class ServiceMap {
	
	public static Map<Integer,Map<Integer,String>> useTypesMap = new HashMap<Integer,Map<Integer,String>>();
	
	public static Map<Integer,String> serviceNames0 = new HashMap<Integer,String>();
	
	public static Map<Integer,String> serviceNames1 = new HashMap<Integer,String>();
	
	public static Map<Integer,String> serviceNames2 = new HashMap<Integer,String>();
	
	public static Map<Integer,String> serviceNames3 = new HashMap<Integer,String>();
	private int useType;//服务类型：0 即时用车 1- 接送机 2 - 接送火车  3日租半日租
	
	private int patternType;//用车形态   (1-接机，2-送机)  |  (1日租 2：半日租)    (1：即时用车)
	static{
		serviceNames0.put(1, "即时用车");
		useTypesMap.put(0, serviceNames0);
		
		serviceNames1.put(1, "接机");
		serviceNames1.put(2, "送机");
		useTypesMap.put(1, serviceNames1);
		
		serviceNames2.put(1, "接站");
		serviceNames2.put(2, "送站");
		useTypesMap.put(2, serviceNames2);
		
		serviceNames3.put(1, "日租");
		serviceNames3.put(2, "半日租");
		useTypesMap.put(3, serviceNames3);
		
		
	}

}
