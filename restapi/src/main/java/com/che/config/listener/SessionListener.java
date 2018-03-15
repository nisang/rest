package com.che.config.listener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * 如果使用shiro来管理权限分配，并实现自动绑定session，则可通过此种方式监听到session的建立与销毁
 * @author Administrator
 *
 */
public class SessionListener implements HttpSessionListener {
	private static final Logger logger = LogManager.getLogger(SessionListener.class);
    private static final int TIME_OUT = 2592000 ; //设置session的存活时间
	
    @Override
    public void sessionCreated(HttpSessionEvent event) {
    	logger.debug("==== Session is created ====");
        event.getSession().setMaxInactiveInterval(TIME_OUT);
    }
    
    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
    	logger.debug("==== Session is destroyed ====");
    }
}