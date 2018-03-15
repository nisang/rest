package com.che.common.pojo;

import com.che.common.web.Req;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CityReq extends Req{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7720796726320326253L;

	private Integer isopen = 1;//是否提供服务，1,提供，0不提供 2:无关提供与否
	
	private Long provinceId;//省份ID
	
	private Integer cityId;//城市ID
	
}
