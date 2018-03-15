package com.che.config.security;

import org.apache.shiro.authc.UsernamePasswordToken;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MobileAuthenticationToken extends UsernamePasswordToken{
	private static final long serialVersionUID = -6190089497623075624L;
	
	private String mobile = "";
	
    public MobileAuthenticationToken(String mobile, String password, boolean rememberMe) {
        super(mobile, password, rememberMe);
        this.mobile = mobile;
    }
    
}