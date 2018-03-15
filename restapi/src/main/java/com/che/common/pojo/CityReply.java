package com.che.common.pojo;

import java.util.List;

import com.che.common.entity.City;
import com.che.common.web.Reply;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CityReply extends Reply{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4869585384761872497L;

	private List<City> citys;
	
}
