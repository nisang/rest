package com.che.common.pojo;

import java.util.List;

import com.che.common.entity.Brand;
import com.che.common.entity.Model;
import com.che.common.entity.Series;
import com.che.common.web.Reply;

import lombok.Data;
import lombok.EqualsAndHashCode;
@Data
@EqualsAndHashCode(callSuper=false)
public class ModelReply extends Reply{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1833837448077113125L;
	
	List<Brand> brandList;
	
	List<Series> seriesList;
	
	List<Model> modelList;
}
