package com.che.config.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.che.common.web.Reply;

/**
 * 参考：
 * http://my.oschina.net/WMSstudio/blog/162594
 * http://blog.csdn.net/shadowsick/article/details/39021265
 * http://www.cppblog.com/guojingjia2006/archive/2014/05/14/206956.html
 * http://blog.csdn.net/chuhx/article/details/51148877
 * 
 * 说明：
 * @author syp
 *
 */
public class LoginAuthenticationFilter extends AccessControlFilter {

	private static final Logger log = LoggerFactory.getLogger(LoginAuthenticationFilter.class);

	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {

		HttpServletRequest httpRequest = (HttpServletRequest) request;  
        HttpServletResponse httpResponse = (HttpServletResponse) response;  
//		Subject currentUser = getSubject(httpRequest, httpResponse);
//        Subject subject = getSubject(request, response);  
//		Subject currentUser1 = SecurityUtils.getSubject();
//		UserEntity user = (UserEntity) currentUser.getPrincipal();
//		if (user != null)//
//			return true;
//		else
//			return false;
        return true;
	}

	protected boolean onAccessDenied(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {
		return onAccessDenied(request, response);
	}

	@SuppressWarnings("deprecation")
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		HttpServletResponse httpResponse;
		HttpServletRequest httpRequest;
		httpResponse = WebUtils.toHttp(response);
		httpRequest = WebUtils.toHttp(request);
		WebUtils.saveRequest(request);
		httpResponse.setStatus(200, "redirect");
		httpResponse.setCharacterEncoding("UTF-8");
		httpResponse.setContentType("application/json; charset=utf-8");
		PrintWriter out = null;
		try {
			out = httpResponse.getWriter();
			Reply reply = new Reply();
			reply.setResultCode(-1);
			reply.setMessage("请先登录");
			JSONObject responseJSONObject = new JSONObject(reply);
			out.append(responseJSONObject.toString());
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
		return false;

	}
}
