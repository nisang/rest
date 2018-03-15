package com.che.page;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.che.common.constant.PageConstant;

@Controller
public class HomeController {

	
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("/index")
	public String index(){
		
		
		return PageConstant.page_index;
	}
	
	
	@RequestMapping("/order/manage")
	public String ordermanage(){
		
		
		return PageConstant.page_order_manage;
	}
	
	@RequestMapping("/order/baodan")
	public String orderbaodan(){
		
		
		return PageConstant.page_order_baodan;
	}
	
	@RequestMapping("/order/baodan/stat")
	public String orderbaodanstat(){
		
		
		return PageConstant.page_order_baodan_stat;
	}
	
	@RequestMapping("order/baodan/realtime")
	public String orderbaodanreal(Model model){
		model.addAttribute("111111111", "");
		return PageConstant.page_order_baodan_realtime;
	}
	
}
