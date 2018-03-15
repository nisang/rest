package com.che.config.security;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.CollectionUtils;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;

/**
 * 参考：role 角色权限
 * http://blog.csdn.net/shadowsick/article/details/39021265
 * 
 * 实现：/test/** = role[admin]
 * @author syp
 *
 */
public class RoleAuthorizationFilter extends AuthorizationFilter {

	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {
		Subject subject = getSubject(request, response);  
        String[] rolesArray = (String[]) mappedValue;  
  
        if (rolesArray == null || rolesArray.length == 0) {  
            // no roles specified, so nothing to check - allow access.  
            return true;  
        }  
  
        Set<String> roles = CollectionUtils.asSet(rolesArray);  
        for (String role : roles) {  
            if (subject.hasRole(role)) {  
                return true;  
            }  
        }  
        return false;  
	}
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {
		return onAccessDenied(request, response);
	}
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;  
        HttpServletResponse httpResponse = (HttpServletResponse) response;  
  
        Subject subject = getSubject(request, response);  
//        if (subject.getPrincipal() == null) {
//            if (WebUtils.isAjax(httpRequest)) {
//                WebUtils.sendJson(httpResponse, JsonUtils.toJSONString(new ViewResult(false,  
//                        "您尚未登录或登录时间过长,请重新登录!")));  
//            } else {
//                saveRequestAndRedirectToLogin(request, response);  
//            }  
//        } else {  
//            if (com.silvery.utils.WebUtils.isAjax(httpRequest)) {  
//                com.silvery.utils.WebUtils.sendJson(httpResponse, JsonUtils.toJSONString(new ViewResult(false,  
//                        "您没有足够的权限执行该操作!")));  
//            } else {  
//                String unauthorizedUrl = getUnauthorizedUrl();  
//                if (StringUtils.hasText(unauthorizedUrl)) {  
//                    WebUtils.issueRedirect(request, response, unauthorizedUrl);  
//                } else {  
//                    WebUtils.toHttp(response).sendError(401);  
//                }  
//            }  
//        }  
        return false;  
	}

}
