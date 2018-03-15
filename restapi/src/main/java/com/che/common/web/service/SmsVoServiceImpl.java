package com.che.common.web.service;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.che.common.constant.Constant;
import com.che.common.pojo.ReplyVo;


/**
 * @author zhoufy
 * @see 2016-6-22
 */
@Service
public class SmsVoServiceImpl implements SmsVoService {

	private static final Log logger = LogFactory.getLog(SmsVoServiceImpl.class);

	@Autowired
	public SmsService smsService;
	@Autowired
	public RedisService redisService;

	@Override
	public String getSmsToken() {
		String token = RandomStringUtils.random(20, Constant.randomChar);
		redisService.put(RedisConstant.DC_KEY_TOKEN + token, token);
		return token;
	}

	@Override
	public ReplyVo sendMsg(String mobile, String smsContent, Integer source, String ip, String token) {
		ReplyVo reply = new ReplyVo();
		// 验证token
		String tokenRedis = redisService.get(RedisConstant.DC_KEY_TOKEN + token);
		if (StringUtils.isBlank(token) || !StringUtils.equals(tokenRedis, token)) {
			logger.error("发送短信，token验证不通过.（token=" + token + ")");
			reply.setMsg("token验证不通过");
			reply.setSuccess(false);
			return reply;
		}
		// 判断渠道
		if (!Constant.sourceList.contains(source)) {
			logger.error("发送短信，渠道验证不通过.（source=" + source + ")");
			reply.setMsg("渠道验证不通过");
			reply.setSuccess(false);
			return reply;
		}
		// 判断发送次数
		if (smsService.isSendOverNum(mobile)) {
			reply.setMsg("该手机号码1小时内发送次数超过5次。");
			reply.setSuccess(false);
			return reply;
		}

		boolean isOk = smsService.sendMsg(mobile, smsContent, source, ip);
		if (isOk) {
			reply.setSuccess(true);
			return reply;
		}

		reply.setMsg("短信发送失败了。");
		reply.setSuccess(false);
		return reply;
	}

	@Override
	public boolean validateToken(String token) {
		if (redisService.hasKey(RedisConstant.DC_KEY_TOKEN + token)) {
			return true;
		}
		return false;
	}

	@Override
	public ReplyVo sendMobileMessage(String mobile, String smsContent, Integer source) {
		ReplyVo reply = new ReplyVo();
		// 判断渠道
		if (!Constant.sourceList.contains(source)) {
			logger.error("发送短信，渠道验证不通过.（source=" + source + ")");
			reply.setMsg("渠道验证不通过");
			reply.setSuccess(false);
			return reply;
		}
		// 判断发送次数
		if (smsService.isSendOverNum(mobile)) {
			reply.setMsg("该手机号码1小时内发送次数超过5次。");
			reply.setSuccess(false);
			return reply;
		}

		boolean isOk = smsService.sendMsg(mobile, smsContent, source, "");
		if (isOk) {
			reply.setSuccess(true);
			return reply;
		}

		reply.setMsg("短信发送失败了。");
		reply.setSuccess(false);
		return reply;
	}
}
