package com.che.common.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.che.common.entity.City;
import com.che.common.mapper.AreaMapper;
import com.che.common.pojo.CityReq;
import com.che.common.web.PageReply;
import com.github.pagehelper.PageHelper;


@RestController
@RequestMapping("/area")
public class AreaController {

	@Autowired
	private AreaMapper areaMapper;
	
	@RequestMapping("/getCitys")
	public PageReply getCitys(@RequestBody(required=false) CityReq req){
		Long provinceId = null;
		Integer isopen = null;
		if(req != null){
			provinceId = req.getProvinceId();
			isopen = req.getIsopen();
		}
		isopen = null;
		
		//开启分页
		PageHelper.startPage(1, 10, true);//true是否计算总页
		//查询分页
		List<City> citys = areaMapper.selectCitys(provinceId, isopen);
		
		//分页实体
		PageReply reply = new PageReply();
		
		//组装分页实体
		reply = new PageReply<City>(citys);
		return reply;
	}
	
	@RequestMapping(value="/test",method={RequestMethod.GET})
	public ModelAndView getCitys1(){
		ModelAndView view = new ModelAndView("downloadpage");
		return view;
	}
    
}
