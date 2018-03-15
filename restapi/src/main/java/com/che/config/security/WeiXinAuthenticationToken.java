package com.che.config.security;

import org.apache.shiro.authc.UsernamePasswordToken;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class WeiXinAuthenticationToken extends UsernamePasswordToken{
	private static final long serialVersionUID = -6190089497623075624L;
	
	private String open_id = null;
	
    public WeiXinAuthenticationToken(String open_id, String password, boolean rememberMe) {
        super(open_id, password, rememberMe);
        this.open_id = open_id;
    }
    
}