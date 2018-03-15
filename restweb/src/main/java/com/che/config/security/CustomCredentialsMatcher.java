package com.che.config.security;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.apache.shiro.crypto.hash.Sha384Hash;

/**
 * 自定义密码验证类
 * 
 * @author quenton
 *
 */
public class CustomCredentialsMatcher extends SimpleCredentialsMatcher {

	@Override
	public boolean doCredentialsMatch(AuthenticationToken authcToken, AuthenticationInfo info) {
		if (authcToken instanceof WeiXinAuthenticationToken) { 
			return true;
		} else if (authcToken instanceof MobileAuthenticationToken) { // 通过手机号登录
			// account_type = Constants.ACCOUNT_TYPE_MOBILE;
			MobileAuthenticationToken token = ((MobileAuthenticationToken) authcToken);
			Object tokenCredentials = String.valueOf(token.getPassword());
			Object accountCredentials = getCredentials(info);
			return equals(tokenCredentials, accountCredentials);
		} else {
			return false;
		}
	}

	// 将传进来密码加密方法
//	private String encrypt(String data) {
//		String sha384Hex = new Sha384Hash(data).toBase64();// 这里可以选择自己的密码验证方式
//		return sha384Hex;
//	}
    
}
