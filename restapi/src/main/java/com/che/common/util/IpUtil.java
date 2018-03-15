package com.che.common.util;

import javax.servlet.http.HttpServletRequest;

public class IpUtil {

	 public static String getRealIp(HttpServletRequest req) {
	        String ip = req.getHeader("X-Real-IP");
	        if (ip != null) {
	            if (ip.indexOf(',') == -1) {
	                return ip;
	            }
	            return ip.split(",")[0];
	        }

	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	            ip = req.getHeader("Proxy-Client-IP");
	        }
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	            ip = req.getHeader("WL-Proxy-Client-IP");
	        }
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	            ip = req.getRemoteAddr();
	        }

	        return ip;
	    }

}
