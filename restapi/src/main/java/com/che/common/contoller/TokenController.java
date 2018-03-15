package com.che.common.contoller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.che.common.pojo.OssEntity;
import com.che.common.web.service.SmsCodeService;
import com.che.config.OSSConfig;
import com.che.user.pojo.SmsTokenReply;

@Controller
@RequestMapping("/token")
public class TokenController {
	
	@Autowired
	private OSSConfig ossConfig;
	
    @Autowired
	private SmsCodeService smsCodeService;

	/**
	 * 获取 Token
	 * 参考：https://help.aliyun.com/document_detail/32016.html?spm=5176.product8314910_31815.6.287.T6wGUU
	 * @return 
	 */
	@RequestMapping( value = "/get/ossToken", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public OssEntity getToken(){
		OssEntity entity = ossConfig.getOssToken();
		return entity;
	}
	
	@RequestMapping(value = "/get/smsToken")
	@ResponseBody
	public SmsTokenReply getToken(HttpServletRequest request) throws Exception {
		SmsTokenReply reply = new SmsTokenReply();
		String token = smsCodeService.getSmsToken();
		reply.setToken(token);
		return reply;
	}

}
