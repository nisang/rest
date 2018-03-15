package com.che.config;


import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import cn.jiguang.common.ClientConfig;
import cn.jiguang.common.resp.APIConnectionException;
import cn.jiguang.common.resp.APIRequestException;
import cn.jpush.api.JPushClient;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Options;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.AndroidNotification;
import cn.jpush.api.push.model.notification.IosNotification;
import cn.jpush.api.push.model.notification.Notification;


@Configuration
public class JpushUtil {
	
	private static final Log LOG = LogFactory.getLog(JpushUtil.class);
	private static final Log log = LogFactory.getLog(JpushUtil.class);
	@Value("${JPush.isProduction}")
	protected static boolean isProduction = true;
	
	private static ClientConfig clientConfig = getClientConfig();
	 
	public static JPushClient  jpushClient;
	
	//proc
	@Value("${JPush.appKey}")
	public static String appKey = "c8b64ba8ddb7666ff1d20af8";
	@Value("${JPush.masterSecret}")
	public  static String masterSecret = "8c8af7b39721f3e0783303cf";
	
	static{
		if(null == jpushClient){
			jpushClient = new JPushClient(masterSecret, appKey);
		}
	}
	/**
	 * ClientConfig 参数配置
	 * @return
	 */
	private static ClientConfig getClientConfig() {
		ClientConfig config = ClientConfig.getInstance();
		config.setMaxRetryTimes(5); 
		config.setConnectionTimeout(10 * 1000);	// 10 seconds
		config.setSSLVersion("TLSv1.1");		// JPush server supports SSLv3, TLSv1, TLSv1.1, TLSv1.2
		config.setApnsProduction(isProduction); 	// development env
		config.setTimeToLive(60 * 60 * 24); // one day
		return config;
	}
	public static void sendPush(String uAid,String msg,String info) {
        PushPayload payload = buildPushObject_all_alias_alert(uAid,msg,info);
        try {
            PushResult result = jpushClient.sendPush(payload);
            LOG.info("Got result - " + result);
            
        } catch (APIConnectionException e) {
            LOG.error("Connection error. Should retry later. ", e);
            
        } catch (APIRequestException e) {
            LOG.error("Error response from JPush server. Should review and fix it. ", e);
            LOG.info("HTTP Status: " + e.getStatus());
            LOG.info("Error Code: " + e.getErrorCode());
            LOG.info("Error Message: " + e.getErrorMessage());
            LOG.info("Msg ID: " + e.getMsgId());
        }
	}
	/**
	 * 推送alert 提示
	 * @param uAids
	 * @param msg
	 * @param info
	 * @return
	 */
	public static PushResult sendPushAlert(List<String> uAids,String msg,String info) {
		PushPayload payload = buildPushObject_all_alias_alert(uAids,msg,info);
		PushResult result = null;
		try {
			result = jpushClient.sendPush(payload);
			LOG.info("Got result - " + result);
			
		} catch (APIConnectionException e) {
			LOG.error("Connection error. Should retry later. ", e);
			
		} catch (APIRequestException e) {
			LOG.error("Error response from JPush server. Should review and fix it. ", e);
			LOG.info("HTTP Status: " + e.getStatus());
			LOG.info("Error Code: " + e.getErrorCode());
			LOG.info("Error Message: " + e.getErrorMessage());
			LOG.info("Msg ID: " + e.getMsgId());
		}
		return result;
	}
	/**
	 * 推送Alert
	 * @param alias 推送目标别名 json格式
	 * @param alert 通知栏显示内容
	 * @param json 供业务使用内容用json格式传递
	 */
	public static void sendAlertPush(List<String> alias,String alert,String json) {
        PushPayload payload = push_all_plat_some_alias_alert(alias,alert,json);
        try {
            PushResult result = jpushClient.sendPush(payload);
            log.info("Got result Alert推送成功- " + result);
        } catch (APIConnectionException e) {
        	// 重试
            log.error("Connection error. Should retry later.极光推送连接失败", e);
            try {
				Thread.sleep(1000);
				log.error("休眠1s后重试创建jPushClient");
				jpushClient = new JPushClient(masterSecret, appKey, null, clientConfig);
				jpushClient.sendPush(payload);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			} catch (APIConnectionException e1) {
				log.error("重试推送失败");
				log.error(e1);
				e1.printStackTrace();
			} catch (APIRequestException e1) {
				log.error("重试返回结果异常");
				e1.printStackTrace();
			}
        } catch (APIRequestException e) {
            log.error("Error response from JPush server. Should review and fix it. ", e);
            log.info("HTTP Status: " + e.getStatus());
            log.info("Error Code: " + e.getErrorCode());
            log.info("Error Message: " + e.getErrorMessage());
            log.info("Msg ID: " + e.getMsgId());
        }
	}
	/**
	 * 构建"alert"推送对象：ios+Android所有平台
	 * @param alias 推送目标别名
	 * @param alert 通知栏显示内容
	 * @param json 供业务使用内容用json格式传递
	 * @return
	 */
	private static PushPayload push_all_plat_some_alias_alert(List<String> alias, String alert, String json) {
        return PushPayload.newBuilder()
                .setPlatform(Platform.all())//推送平台
                .setAudience(Audience.alias(alias))// 推送目标
                .setNotification(getNotification2Plat(alert, json))// 通知内容体。
                .setOptions(getOptions())// 推送参数
                .build();
    }
	
	private static Options getOptions(){
		return Options.newBuilder()
				.setApnsProduction(isProduction)
				.setTimeToLive(0).build();
	} 
	
	/**
	 * 构建2种平台的“通知”对象
	 * @param androidPlat 安卓平台的“通知”对象
	 * @param iosPlat IOS平台的“通知”对象
	 * @return
	 */
	private static Notification getNotification2Plat(String alert, String json){
		return Notification.newBuilder()
        		.addPlatformNotification(
        				AndroidNotification.newBuilder()
        				.setAlert(alert)
        				.addExtra("json", json).build()
        		)
        		.addPlatformNotification(
        				IosNotification.newBuilder()
        				.setAlert(alert).
        				setSound("default").
        				setContentAvailable(true)
        				.addExtra("json", json).build()
        		)
        		.build();
	}
	/**
	 * 推送无提示
	 * @param uAids
	 * @param msg
	 * @param info
	 * @return
	 */
	public static PushResult sendPushNoAlert(List<String> uAids,String msg,String info) {
		PushPayload payload = buildPushObject_all_alias(uAids,msg,info);
		PushResult result = null;
		try {
			result = jpushClient.sendPush(payload);
			LOG.info("Got result - " + result);
		} catch (APIConnectionException e) {
			LOG.error("Connection error. Should retry later. ", e);
		} catch (APIRequestException e) {
			LOG.error("Error response from JPush server. Should review and fix it. ", e);
			LOG.info("HTTP Status: " + e.getStatus());
			LOG.info("Error Code: " + e.getErrorCode());
			LOG.info("Error Message: " + e.getErrorMessage());
			LOG.info("Msg ID: " + e.getMsgId());
		}
		return result;
		
	}
	
	public static void sendPush(String uAid,String msg,Map<String,String> infoMap) {
        PushPayload payload = buildPushObject_all_alias_alert(uAid,msg,infoMap);
        try {
            PushResult result = jpushClient.sendPush(payload);
            LOG.info("Got result - " + result);
            
        } catch (APIConnectionException e) {
            LOG.error("Connection error. Should retry later. ", e);
            
        } catch (APIRequestException e) {
            LOG.error("Error response from JPush server. Should review and fix it. ", e);
            LOG.info("HTTP Status: " + e.getStatus());
            LOG.info("Error Code: " + e.getErrorCode());
            LOG.info("Error Message: " + e.getErrorMessage());
            LOG.info("Msg ID: " + e.getMsgId());
        }
	}
	
	public static void sendMessage(String msg) {
        PushPayload payload = buildMessageObject_all_alias_alert(msg,"");
        try {
            PushResult result = jpushClient.sendPush(payload);
            LOG.info("Got result - " + result);
            
        } catch (APIConnectionException e) {
            LOG.error("Connection error. Should retry later. ", e);
            
        } catch (APIRequestException e) {
            LOG.error("Error response from JPush server. Should review and fix it. ", e);
            LOG.info("HTTP Status: " + e.getStatus());
            LOG.info("Error Code: " + e.getErrorCode());
            LOG.info("Error Message: " + e.getErrorMessage());
            LOG.info("Msg ID: " + e.getMsgId());
        }
	}
	
	private static PushPayload buildPushObject_all_alias_alert(String uAid,String msg,Map<String,String> infoMap) {
        return PushPayload.newBuilder()
                .setPlatform(Platform.all())
                .setAudience(Audience.alias(uAid))
                .setNotification(Notification.newBuilder()
                		.addPlatformNotification(AndroidNotification.newBuilder()
                				.setAlert(msg).setTitle(msg)
                				.addExtra("type", infoMap.get("type")).addExtra("key", infoMap.get("key")).build())
                		.addPlatformNotification(IosNotification.newBuilder()
                				.setAlert(msg).setSound("default").setContentAvailable(true).setBadge(1)
                				.addExtra("type", infoMap.get("type")).addExtra("key", infoMap.get("key")).build())
                		.build())
                .setOptions(Options.newBuilder().setApnsProduction(isProduction).setTimeToLive(0).build())
                .build();
    }
	
	private static PushPayload buildPushObject_all_alias_alert(String uAid,String msg,String info) {
        return PushPayload.newBuilder()
                .setPlatform(Platform.all())
                .setAudience(Audience.alias(uAid))
                .setNotification(Notification.newBuilder()
                		.addPlatformNotification(AndroidNotification.newBuilder()
                				.setAlert(msg).setTitle(msg)
                				.addExtra("type", info).build())
                		.addPlatformNotification(IosNotification.newBuilder()
                				.setAlert(msg).setSound("default").setContentAvailable(true).setBadge(1)
                				.addExtra("type", info).build())
                		.build())
                .setOptions(Options.newBuilder().setApnsProduction(isProduction).setTimeToLive(0).build())
                .build();
    }
	
	private static PushPayload buildPushObject_all_alias_alert(List<String> uAid,String msg,String info) {
		return PushPayload.newBuilder()
				.setPlatform(Platform.all())
				.setAudience(Audience.alias(uAid))
				.setNotification(Notification.newBuilder()
						.addPlatformNotification(AndroidNotification.newBuilder()
								.setAlert(msg).setTitle(msg)
								.addExtra("type", info).build())
								.addPlatformNotification(IosNotification.newBuilder()
										.setAlert(msg).setSound("default").setContentAvailable(true).setBadge(1)
										.addExtra("type", info).build())
										.build())
										.setOptions(Options.newBuilder().setApnsProduction(isProduction).setTimeToLive(0).build())
										.build();
	}
	
	private static PushPayload buildPushObject_all_alias(List<String> uAid,String msg,String info) {
		return PushPayload.newBuilder()
				.setPlatform(Platform.all())
				.setAudience(Audience.alias(uAid))
				.setMessage(Message.newBuilder().setMsgContent(msg).addExtra("type", info).build())
				.setOptions(Options.newBuilder().setApnsProduction(isProduction).setTimeToLive(0).build())
				.build();
	}
	
	private static PushPayload buildMessageObject_all_alias_alert(String msg,String info) {
        return PushPayload.newBuilder()
                .setPlatform(Platform.all())
                .setAudience(Audience.all())
                .setMessage(Message.newBuilder().setMsgContent(msg).addExtra("info", info).build())
                .setOptions(Options.newBuilder().setApnsProduction(isProduction).setTimeToLive(0).build())
                .build();
    }
}
