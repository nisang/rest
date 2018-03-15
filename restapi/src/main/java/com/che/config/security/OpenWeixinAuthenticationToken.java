package com.che.config.security;

import org.apache.shiro.authc.UsernamePasswordToken;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class OpenWeixinAuthenticationToken extends UsernamePasswordToken {

	private static final long serialVersionUID = 1540802768842967207L;
	
	private String wpopen_id = null;	
	
    public OpenWeixinAuthenticationToken(String wpopen_id, String password, boolean rememberMe) {
        super(wpopen_id, password, rememberMe);
        this.wpopen_id = wpopen_id;
    }
    

}
