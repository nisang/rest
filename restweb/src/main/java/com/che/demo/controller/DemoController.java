package com.che.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.che.common.web.PageReq;
import com.che.common.web.Reply;
import com.che.demo.pojo.UserDemo;
import com.github.pagehelper.PageHelper;

@Controller
@RequestMapping("/democ")
public class DemoController {
	
	
	@RequestMapping(value = "/d1", method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public UserDemo d1(HttpServletRequest request, HttpServletResponse response, String param)  {
		UserDemo user = new UserDemo();
		user.setName(param);
		user.setAge(99);
		user.setDdd(23.32d);
		return user;
	}
	@RequestMapping(value="/page/test",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Reply page(HttpServletRequest request, HttpServletResponse response, @RequestBody PageReq req){
		Reply reply = new Reply();
		PageHelper pageHelper = new PageHelper();
		pageHelper.startPage(req.getPageNum(), req.getPageSize(), true);
		pageHelper.orderBy(" id desc");
		return reply;
	}

}
