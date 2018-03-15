package com.che.common.pojo;

import com.che.common.web.Req;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ModelReq extends Req{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4891753750983590144L;

	private Integer brandId;//品牌ID
	
	private Integer seriesId;//车系ID
	
}
