package com.che.config.listener;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 跨域filter
 * @author Administrator
 *
 */
public class AccessControlFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("init----------");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		System.out.println(httpRequest.getContentType());
		HttpSession session = httpRequest.getSession();
		httpResponse.addHeader("Access-Control-Allow-Origin", "*");
		httpResponse.addHeader("Access-Control-Allow-Methods", "POST,GET");
		httpResponse.addHeader("Access-Control-Allow-Headers", "POWERED-BY-FANTONG");
		httpResponse.addHeader("Access-Control-Max-Age", "30");
		chain.doFilter(httpRequest, httpResponse);
	}

	@Override
	public void destroy() {
		
	}
	

}
