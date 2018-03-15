package com.che.common.web;

/**
 * web常量
 */
public abstract class Constants {
	
	public static final Integer REPLY_SUCCESS = 0;//成功
    public static final Integer RESULT_SUCCESS = 0;//成功
    public static final Integer RESULT_ERROR_LOGIN = -1;//登录异常 或 session超时
    public static final Integer RESULT_ERROR_SYSERROR = -2;//系统错误（如error500）
    public static final Integer RESULT_UNAUTH = -3;//没有权限(用于区分会员和非会员)
    public static final Integer RESULT_ERROR_PARAM = -4;//参数错误（输入参数异常）
    public static final Integer RESULT_ERROR_REQUEST = -6;//请求参数异常（区分终端错误和服务器处理错误）
    public static final Integer RESULT_ERROR_KICKOUT = -7;//用户被踢出了
    public static final Integer RESULT_ERROR_USER_NOT_EXIST = -8;//用户不存在
    
    /** 帐户类型 **/
    //账户类型0:anonymous,1:mobile, 2:openqq_id,3:openwb_id, 4:openwx_id
    public static final Integer ACCOUNT_TYPE_ANONY =  0;
    public static final Integer ACCOUNT_TYPE_MOBILE =  1;
    public static final Integer ACCOUNT_TYPE_OPEN_QQ =  2;
    public static final Integer ACCOUNT_TYPE_OPEN_WEIBO =  3;
    public static final Integer ACCOUNT_TYPE_OPEN_WEIXIN =  4;

    
    /** 认证失败类型 **/
	public static final Integer AUTHEXCEPTION_ACCOUNTNOTEXISTS = 7263;     // 用户帐户不存在
	public static final Integer AUTHEXCEPTION_ACCOUNTDISABLED  = -12;     // 用户帐户已被禁用
	public static final Integer AUTHEXCEPTION_UNKOWNSOURCE     = -13;     // 未知来源
	public static final Integer AUTHEXCEPTION_ERRORTOKEN       = -14;     // TOKEN错误
	public static final Integer AUTHEXCEPTION_LOGINCOUNT       = -15;     // 登录失败超过限制
	public static final Integer AUTHEXCEPTION_OTHER            = -16;     // 其它错误
	
	
	public static final String SHIRO_USER_LOGIN_FAILED_LIMIT_COUNT = "carsource_shiroUserLoginFailedLimitCount";   
	
    /** 部署环境 **/
    public static final String  DEPLOY_ALPHA                              = "alpha";
    public static final String  DEPLOY_BETA                               = "beta";
    public static final String  DEPLOY_PRODUCE                            = "produce";
    
    /** 积分类型code **/
    public static final String INTEGRAL_INVITE_REGIST = "inviteRegist";
    
    public static String WEBSOCKET_USERNAME = "websocker_username";
	public static String SESSION_USERNAME= "websocker_sessionusername";
}
