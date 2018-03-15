package com.che.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.che.common.constant.PageConstant;

@Controller
public class LoginController {
	
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("/login")
	public String login(){
		
		
		return PageConstant.page_login;
	}

}
