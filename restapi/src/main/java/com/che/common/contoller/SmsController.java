package com.che.common.contoller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.che.common.pojo.ReplyVo;
import com.che.common.util.IpUtil;
import com.che.common.util.Md5Encrypt;
import com.che.common.util.RandomUtil;
import com.che.common.web.Reply;
import com.che.common.web.service.SmsCodeService;
import com.che.user.entity.ValidateEntity;
import com.che.user.pojo.SmsAuthReq;
import com.che.user.pojo.ValidateReq;

@Controller
@RequestMapping("/sms/code")
public class SmsController {
	private static final Logger logger = Logger.getLogger(SmsController.class);
    @Autowired
	private SmsCodeService smsCodeService;
	
    public static final String appkey = "352D78C483D7925D89963D4A5FEB777A";
    
    /**
     * 短信验证码验证
     * @return
     */
	@RequestMapping( value="/auth",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Reply auth(@RequestBody SmsAuthReq req){
		Reply reply = new Reply();
		validatSmscode(reply, req.getMobile(), req.getSmsCode());
		return reply;
	}
	
	
	
	/**
	 * 校验验证码
	 * @param reply
	 * @param mobile
	 */
	public void validatSmscode(Reply reply, String mobile, String code){
		ValidateEntity smsCode = smsCodeService.findValidateCodeByPhone(mobile);
		logger.info("手机号为：" + mobile + "的验证信息");
		
		reply.setReplyCode(0);
		reply.setMessage("验证通过！");
		if(smsCode != null){
			Date sendCodeDate = smsCode.getAddtime();
			if (sendCodeDate == null) {
				reply.setReplyCode(-1);
	        	reply.setMessage("验证码错误！");
			} else {
				long time = new Date().getTime() - sendCodeDate.getTime();
				// 获取验证码
				if (time < 90000) {
					String checkCode = smsCode.getCode();
					if (!code.equals(checkCode)) {
						reply.setReplyCode(-1);
			        	reply.setMessage("验证码错误！");
					}
				}else{
					reply.setReplyCode(-2);
		        	reply.setMessage("验证码超时！");
				}
			}
		}else{
			reply.setReplyCode(-3);
        	reply.setMessage("验证码不存在！");
		}
		
	}
	
    /**
	 * 发送验证码
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/send")
	@ResponseBody
	public Reply doSendMobileCode(HttpServletRequest request, @RequestBody ValidateReq req) throws Exception {
		Reply reply = new Reply();
		if (null == req.getMobile()) {
			reply.setReplyCode(-1);
			reply.setMessage("请填写手机号！");
			return reply;
		}
		
		//签名验证
		String sign = Md5Encrypt.md5(appkey + req.getToken() + req.getTime() + req.getMobile());
		if(!sign.equals(req.getSignature())){
			reply.setReplyCode(-1);
			reply.setMessage("签名验证失败！");
			return reply;
		}
		
		// step 2 : 处理请求，发送短信
		StringBuffer codeStr = new StringBuffer();
		String token = smsCodeService.getSmsToken();
		req.setToken(token);
		int node = RandomUtil.setRandom();// 生成验证码
		codeStr.append("");
		codeStr.append("验证码：");
		codeStr.append(node);
		codeStr.append("，10分钟内有效。【车城快车】");
		String validateCode = String.valueOf(node);
		ValidateEntity vate = new ValidateEntity();
		vate.setDestination(req.getMobile());
		vate.setCode(validateCode);
		vate.setSource("4");
		smsCodeService.saveValidateCode(vate);
		// 发送短信
		ReplyVo replyVo = smsCodeService.sendMsg(req.getMobile(), codeStr.toString(), 4, IpUtil.getRealIp(request), req.getToken());
		
		if(replyVo.isSuccess()){
			logger.info("手机号码_mobile:" + req.getMobile() + "短信code：" + validateCode + "短信内容：" + codeStr.toString());
		}else{
			reply.setReplyCode(2);
			if(replyVo.getMsg() != null && replyVo.getMsg().contains("token")){
				reply.setMessage("token失效，请重试！");
			}else{
				reply.setMessage(replyVo.getMsg());
			}
		}
		
		return reply;
	}
	/**
	 * 缓存验证码对象
	 * @param smsCode
	 * @return
	 */
	@Cacheable(value="smsCode#900")
	public ValidateEntity saveSmsCode(ValidateEntity smsCode){
		return smsCode;
	}

}
