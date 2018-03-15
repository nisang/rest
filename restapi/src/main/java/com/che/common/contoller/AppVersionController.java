package com.che.common.contoller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.che.common.pojo.AppVersionReply;
import com.che.common.web.service.AppVersionService;

@RestController
@RequestMapping("/app")
public class AppVersionController {
	
    @Autowired
	private AppVersionService appVersionService;
	@RequestMapping("/version")
	public AppVersionReply version(HttpServletRequest request){
		return appVersionService.version();
	}

}
