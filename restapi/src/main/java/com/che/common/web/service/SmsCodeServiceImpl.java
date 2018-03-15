package com.che.common.web.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.che.common.pojo.ReplyVo;
import com.che.user.entity.ValidateEntity;
import com.che.user.mapper.SmsCodeMapper;

/**
 * @Description:
 * @author wangyanlong
 * @date 2015-12-10下午1:25:47
 */
@Service("smsCodeService")
public class SmsCodeServiceImpl implements SmsCodeService {

	@Resource
	private SmsCodeMapper smsCodeMapper;

	@Autowired(required=false)
	private SmsVoService smsVoService;
	
	@Override
	public void saveValidateCode(ValidateEntity vate) {
		smsCodeMapper.deleteValidateCode(vate.getDestination());
		smsCodeMapper.saveValidateCode(vate);
	}

	@Override
	public void deleteValidateCode(String phone) {
		smsCodeMapper.deleteValidateCode(phone);
	}

	@Override
	public ValidateEntity findValidateCodeByPhone(String phone) {
		return this.smsCodeMapper.findValidateCodeByPhone(phone);
	}

	@Override
	public String getSmsToken() {
		return smsVoService.getSmsToken();
	}

	@Override
	public ReplyVo sendMsg(String mobile, String content, Integer source, String ip, String token) {
		return smsVoService.sendMsg(mobile, content, source, ip, token);
	}

	@Override
	public Boolean validateToken(String token) {
		return smsVoService.validateToken(token);
	}
}
