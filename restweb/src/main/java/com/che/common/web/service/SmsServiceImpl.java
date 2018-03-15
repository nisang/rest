package com.che.common.web.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.che.common.constant.Constant;
import com.che.common.util.MyDateUtils;
import com.che.user.mapper.SmsLogMapper;

/**
 * 发送短信服务（并记录短信日志）
 *  
 * @author <font color='blue'>zhoufy</font>
 * @version 1.0
 * @date 2016-6-15  
 */
@Service("smsService")
public class SmsServiceImpl extends SmsSendUtil implements SmsService {

	private static final Log logger = LogFactory.getLog(SmsServiceImpl.class);

	// 短信发送配置
	@Resource
	private SmsLogMapper smsLogMapper;

	@Override
	public boolean sendMsg(String mobile, String smsContent, Integer source, String ip) {
		boolean isSuccess = super.sendMsgUtil(mobile, smsContent, ip);
		recordSendLog(mobile, smsContent, isSuccess, source);
		return isSuccess;
	}
	
	private void save(SmsSendLog log) {
		smsLogMapper.save(log);
	}
	
	/**
	 * 记录发送短信的日志
	 * @param mobile
	 * @param smsContent
	 * @param isSuccess
	 * @param isSuccess	渠道
	 */
	private void recordSendLog(String mobile, String smsContent, boolean isSuccess, Integer source) {
		try {
			SmsSendLog ssl = new SmsSendLog();
			ssl.setAddTime(MyDateUtils.getCurFullTimestamp());
			ssl.setMobile(mobile);
			ssl.setSmsContent(smsContent);
			ssl.setSource(source);
			if(isSuccess){
				ssl.setIsSuccess(Constant.SUCCESS);
			}else{
				ssl.setIsSuccess(Constant.FAIL);
			}
			this.save(ssl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean isSendOverNum(String mobile) {
		List<SmsSendLog> list = smsLogMapper.querySendNum(mobile, 5);
		if(list==null || list.size()<5){
			return false;
		}
		//如果数据多于5条
		SmsSendLog ssl = list.get(4);
		if(ssl!=null){
			Long beginTime = ssl.getAddTime().getTime();
			Long endTime = System.currentTimeMillis();
			if(beginTime+60*60*1000<endTime){
				return false;
			}else{
				logger.info("(SmsSendLog)id="+ssl.getId()+", time="+beginTime);
			}
		}
		return true;
	}
}
