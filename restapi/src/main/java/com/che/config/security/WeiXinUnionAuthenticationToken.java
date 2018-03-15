package com.che.config.security;

import org.apache.shiro.authc.UsernamePasswordToken;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class WeiXinUnionAuthenticationToken extends UsernamePasswordToken{
	
	private static final long serialVersionUID = 3205721467172349612L;
	private String union_id = null;	
	
    public WeiXinUnionAuthenticationToken(String union_id, String password, boolean rememberMe) {
        super(union_id, password, rememberMe);
        this.union_id = union_id;
    }
    
}