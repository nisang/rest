package com.che.core;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.che.common.web.Reply;
/**
 * 描述：拦截器
 * 添加http请求头头部验证
 * carsource_header:aichegujia62xJ4XG7HFOrLzRCfEk
 * carsource_auth:9bc06d4b7246fe334035f6f13b03a852
 * @author syp
 *
 */

public class CP_HttpHeaderInterceptor extends HandlerInterceptorAdapter{
	
	private static final String CARHEADER= "b52f8d7dd28769d9";
	private static final String CARAUTH ="14ee34c9ff6e9fcf";
	private static final String SERVERTIME = "";
	/**
	 * 进入方法前执行
	 * md5(headerHeader,16) = b52f8d7dd28769d9
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String headerHeader = request.getHeader("carsource_header");
		String headerAuth = request.getHeader("carsource_auth");
		String clientTime = request.getHeader("client_time");
		if(false &&( headerHeader == null || headerAuth == null || clientTime==null)){
			//返回json字符串
			response.setStatus(200, "redirect");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			PrintWriter out = null;
			try{
				out = response.getWriter();//new PrintWriter(response.getOutputStream());
				Reply rep = new Reply();
				rep.setMessage("oops,header is error.墙里开花，墙外香，你被挡在墙外了，花太香");//new String("头部不合法".getBytes(),"UTF-8") 。
				rep.setResultCode(-0x03);
				JSONObject responseJSONObject = new JSONObject(rep);
				out.append(responseJSONObject.toString());
			}catch(IOException ex){
				ex.printStackTrace();
			}finally {
				out.close();
			}
			return false;
		}else if(CARHEADER.equals(headerHeader) && CARAUTH.equals(headerAuth)){
			return true;
		}
		return super.preHandle(request, response, handler);
	}
	
	/**
	 * 执行方法后执行
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
//		String callBack = request.getParameter("callback");
//		if( callBack!=null ){
//			
//			System.out.println(callBack);
//		}
		super.postHandle(request, response, handler, modelAndView);
//		String callBack = request.getParameter("callback");
//		if( callBack!=null ){
//			PrintWriter out = response.getWriter();
//			
//			ResponseWrapper responseWrapper = new ResponseWrapper((HttpServletResponse) response);
//			String responseContent = new String(responseWrapper.getDataStream());
//			response.setStatus(200, "redirect");
//			response.setCharacterEncoding("UTF-8");
//			response.setContentType("application/json; charset=UTF-8");
//			
//			try{
//				out = responseWrapper.getWriter();
//				responseContent = "callback("+responseContent+")";
//				out.append(responseContent);
//			}catch(IOException ex){
//				ex.printStackTrace();
//			}finally {
//				out.close();
//			}
//		}
//		return;
	}
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
}
