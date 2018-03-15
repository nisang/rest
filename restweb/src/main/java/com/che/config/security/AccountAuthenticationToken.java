package com.che.config.security;

import org.apache.shiro.authc.UsernamePasswordToken;

import lombok.Data;
@Data
@SuppressWarnings("deprecation")
public class AccountAuthenticationToken extends UsernamePasswordToken {
	private static final long serialVersionUID = -6190089497623075624L;
	
	private String account = "";
	
    public AccountAuthenticationToken(String account, String password, boolean rememberMe) {
        super(account, password, rememberMe);
        this.account = account;
    }
}
