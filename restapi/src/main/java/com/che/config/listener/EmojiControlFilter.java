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

/**
 * 过来Emoji表情
 * @author Administrator
 *
 */
public class EmojiControlFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		 HttpServletRequest servletrequest = (HttpServletRequest) request; 
	       //新加代码http://www.2cto.com/kf/201512/455191.html
	       HttpServletResponse servletresponse = (HttpServletResponse) response; 
	       String param = ""; 
	       String paramValue = ""; 
	       servletresponse.setContentType("text/html"); 
	       servletresponse.setCharacterEncoding("UTF-8"); 
	       servletrequest.setCharacterEncoding("UTF-8");
	       System.out.println(servletrequest.getParameter("union_id"));
	       java.util.Enumeration params = servletrequest.getParameterNames();
	       while (params.hasMoreElements()) { 
		        param = (String) params.nextElement(); 
		        String[] values = servletrequest.getParameterValues(param);//获得每个参数的value 
		        for (int i = 0; i < values.length; i++) {
			         paramValue = values[i]; 
	//		         paramValue = paramValue.replaceAll("<script>", "(*"); 
	//		         paramValue = paramValue.replaceAll("</script>", ")"); 
			         paramValue = paramValue.replaceAll("[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u2600-\u27ff]", ""); //过滤emoji表情
			        //这里还可以增加，如领导人 自动转义成****,可以从数据库中读取非法关键字。 
			         values[i] = paramValue; 
		        }
	       }
        String param1 = ""; 
	    String paramValue1 = ""; 
        java.util.Enumeration params1 = servletrequest.getAttributeNames(); 
	       while (params1.hasMoreElements()) {
	    	    param1 = (String) params1.nextElement(); 
	    	    System.out.println(param1);
		        String[] values1 = servletrequest.getParameterValues(param1);//获得每个参数的value 
		        for (int i = 0; i < values1.length; i++) {
		        	paramValue1 = values1[i];
		        	paramValue1 = paramValue1.replaceAll("[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u2600-\u27ff]", ""); //过滤emoji表情
			        //这里还可以增加，如领导人 自动转义成****,可以从数据库中读取非法关键字。 
		        	values1[i] = paramValue1; 
		        	System.out.println(values1);
		        }
		        //把转义后的参数重新放回request中 
		        request.setAttribute(param1, paramValue1); 
	       }
	        
	       chain.doFilter(request, response); 
	}

	@Override
	public void destroy() {
		
	}

}
