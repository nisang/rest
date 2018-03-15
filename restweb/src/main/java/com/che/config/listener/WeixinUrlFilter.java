package com.che.config.listener;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.che.common.util.SHA1;


public class WeixinUrlFilter implements Filter{

	private static String Token = "haoxuantech1992";
	public void init(FilterConfig filterConfig) throws ServletException {
		 System.out.println("WeixinUrlFilter启动成功!");  
		
	}
	public void doFilter(ServletRequest request1, ServletResponse response2, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) request1;  
        HttpServletResponse response = (HttpServletResponse) response2;  
        //微信服务器将发送GET请求到填写的URL上,这里需要判定是否为GET请求  
        boolean isGet = request.getMethod().toLowerCase().equals("get");  
        System.out.println("获得微信请求:" + request.getMethod() + " 方式");  
        if (isGet) {
            //验证URL真实性  
            String signature = request.getParameter("signature");// 微信加密签名  
            String timestamp = request.getParameter("timestamp");// 时间戳  
            String nonce = request.getParameter("nonce");// 随机数  
            String echostr = request.getParameter("echostr");//随机字符串  
            List<String> params = new ArrayList<String>();  
            params.add(Token);  
            params.add(timestamp);  
            params.add(nonce);  
            //1. 将token、timestamp、nonce三个参数进行字典序排序  
            Collections.sort(params, new Comparator<String>() {  
                public int compare(String o1, String o2) {  
                    return o1.compareTo(o2);  
                }  
            });  
            //2. 将三个参数字符串拼接成一个字符串进行sha1加密  
            String temp = SHA1.encode(params.get(0) + params.get(1) + params.get(2));  
            if (temp.equals(signature)) {  
                response.getWriter().write(echostr);  
            }  
        } else {  
            //处理接收消息  
        }
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	

}
