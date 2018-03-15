package com.che.common.web;

/**
 * 消息
 * @author Administrator
 *
 */
public interface MessageReply {
	
	String message_success = "登录成功";
	String message_failed = "登录失败";
	String RELEASE_CAR_TIP = "车辆发布成功";
	String RELEASE_CAR_TIP_FAIL = "车辆发布失败";
	/** 收到估价信息  */
	String message_assess_car = "收到一条新估价。#{}对您的#{}估价#{}，点此查看详情>>（进入车辆详情页）";
	/** 收到申请看车申请  */
	String message_apply_car = "收到一条新看车申请。#{}对您的#{}发起了看车申请，点此查看详情>>（进入车辆详情页）";
	/** 收到同意看车 */
	String message_apply_car_argee = "您的看车申请已被同意。[用户]同意了您对[车型]的看车申请，他的手机号：[绑定手机号]，您可直接与其联系。点此查看详情>>（进入车辆详情页）";
	/** 认证通过 */
	String message_certificate_agree = "恭喜您认证审核通过。您现在是认证会员，可以对心仪的车辆发起看车申请啦。点此看车>>（进入谁在估车页面）";
	/** 认证失败 */
	String message_certificate_refuse = "很抱歉，您的认证审核未通过。请至个人中心重新上传资料。点此上传>>（进入认证页面）";
	
	String query_success_msg ="查询成功";
	//#{} 刚刚发布了一辆 #{}
	String SOCKER_MESSAGE = "%s 刚刚发布了一辆  %s";
	
	String MESSAGE_NONE = "没有更多数据了";
}
