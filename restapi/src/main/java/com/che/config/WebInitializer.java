package com.che.config;

import java.util.EnumSet;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.core.annotation.Order;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.che.config.listener.AccessControlFilter;
import com.che.config.listener.SessionListener;

/**
 * web 
 * @author syp
 *
 */

@Order(2)
public class WebInitializer implements WebApplicationInitializer {
	public void onStartup(ServletContext servletContext) throws ServletException {
        EnumSet<DispatcherType> dispatcherTypes = EnumSet.of(DispatcherType.REQUEST, DispatcherType.FORWARD);
      //  servletContext.setInitParameter("isLog4jAutoInitializationDisabled", "true");
        
		// session-timeout
		servletContext.addListener(new SessionListener());
		
		//Log4jConfigListener   log4jConfigLocation
		servletContext.setInitParameter("log4jConfiguration", "classpath:log4j2-test.yaml");
		
//		servletContext.addListener(Log4jServletContextListener.class);
//		Log4jServletFilter log4jServletFilter = new Log4jServletFilter();
//		FilterRegistration.Dynamic log4jFilter = servletContext.addFilter("log4jServletFilter", log4jServletFilter);
//		log4jFilter.addMappingForUrlPatterns(dispatcherTypes, true, "/*");
//		
		// filter:CharacterEncodingFilter
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		FilterRegistration.Dynamic characterEncoding = servletContext.addFilter("characterEncoding", characterEncodingFilter);
		characterEncoding.addMappingForUrlPatterns(dispatcherTypes, true, "/*");
		
		AccessControlFilter accessFilter = new AccessControlFilter();
		FilterRegistration.Dynamic accessEncoding= servletContext.addFilter("accessEncoding", accessFilter);
		accessEncoding.addMappingForUrlPatterns(dispatcherTypes, true, "/*");
		
//		EmojiControlFilter emojiFilter = new EmojiControlFilter();
//		FilterRegistration.Dynamic emojiEncoding= servletContext.addFilter("emojiEncoding", emojiFilter);
//		emojiEncoding.addMappingForUrlPatterns(dispatcherTypes, true, "/*");
		//new RestTemplate();
		//ClientHttpRequestInterceptor
		// servlet:druid stat view
//		ServletRegistration.Dynamic druidStatView = servletContext.addServlet("druidStatView", new StatViewServlet());
//		druidStatView.addMapping("/druid/*");
		
		// demoServlet
//		DemoServlet demoServlet = new DemoServlet();
//		ServletRegistration.Dynamic dynamic = servletContext.addServlet("demoServlet", demoServlet);
//		dynamic.setLoadOnStartup(2);
//		dynamic.addMapping("/demo_servlet");
	}
}
