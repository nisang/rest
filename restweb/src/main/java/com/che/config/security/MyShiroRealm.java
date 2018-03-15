package com.che.config.security;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

//import org.apache.logging.log4j.LogManager;
//import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.che.common.web.Constants;
import com.che.user.entity.UserEntity;
import com.che.user.mapper.UserEntityMapper;

/**
 * 登录时可调用的方法
 * @author Administrator
 *
 */
@Component("myShiroRealm")
public class MyShiroRealm extends AuthorizingRealm {
	//private static final Logger logger = LogManager.getLogger(AuthorizingRealm.class);
	@Resource
	private CacheManager redisCacheManager;
	
	@Autowired
	private UserEntityMapper userEntityMapper;

	public MyShiroRealm() {
		setName("restapiShiroDbRealm");
	}

	/**
	 * 为当前登录的Subject授予角色和权限
	 * 
	 * @see 经测试:本例中该方法的调用时机为需授权资源被访问时
	 * @see 经测试:并且每次访问需授权资源时都会执行该方法中的逻辑,这表明本例未启用AuthorizationCache
	 * @see web层可以有shiro的缓存，dao层可以配有hibernate的缓存（后面介绍）
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 因为非正常退出,即没有显式调用SecurityUtils.getSubject().logout()
		// (可能是浏览器关闭,或超时),但此时缓存依旧存在(principals),所以会自己跑到授权方法里.
		if (!SecurityUtils.getSubject().isAuthenticated()) {
			doClearCache(principals);
			SecurityUtils.getSubject().logout();
			return null;
		}
		
		doClearCache(principals);
		
		SimpleAuthorizationInfo sazi = new SimpleAuthorizationInfo();
	
		sazi.addRole("member");
		sazi.addStringPermission("member");
		
		return sazi;
	}
	
	// 认证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
	    if (null != SecurityUtils.getSubject() && !SecurityUtils.getSubject().isAuthenticated()) {
            doClearCache(SecurityUtils.getSubject().getPrincipals());
	    }
	    
		if (authcToken == null){
			throw new AuthenticationException(Constants.AUTHEXCEPTION_ERRORTOKEN+"");
		}
		
		UserEntity userEntity = null;
		if (authcToken instanceof MobileAuthenticationToken){ 
			MobileAuthenticationToken token = (MobileAuthenticationToken)authcToken;
			if (null == token || null == token.getMobile()){//|| null == token.getPassword()
				throw new AuthenticationException(Constants.AUTHEXCEPTION_ERRORTOKEN+"");
			}
			userEntity = userEntityMapper.getUsersByMobile(token.getMobile());
		} else if(authcToken instanceof AccountAuthenticationToken){
			AccountAuthenticationToken token = (AccountAuthenticationToken)authcToken;
			if (null == token || null == token.getAccount()){//|| null == token.getPassword()
				throw new AuthenticationException(Constants.AUTHEXCEPTION_ERRORTOKEN+"");
			}
			userEntity = userEntityMapper.getUsersByAccount(token.getAccount());
		}else if(authcToken instanceof WeiXinAuthenticationToken){
			WeiXinAuthenticationToken token = (WeiXinAuthenticationToken) authcToken;
			if (null == token || null == token.getOpen_id() ){
				throw new AuthenticationException(Constants.AUTHEXCEPTION_ERRORTOKEN+"");
			}
			userEntity = userEntityMapper.getUserByOpenId(token.getOpen_id());
		} else if(authcToken instanceof OpenWeixinAuthenticationToken){
			OpenWeixinAuthenticationToken token = (OpenWeixinAuthenticationToken) authcToken;
			if (null == token || null == token.getWpopen_id()){
				throw new AuthenticationException(Constants.AUTHEXCEPTION_ERRORTOKEN+"");
			}
			userEntity = userEntityMapper.queryUserbyOpenId(token.getWpopen_id());
		}else if(authcToken instanceof WeiXinUnionAuthenticationToken){
			WeiXinUnionAuthenticationToken token = (WeiXinUnionAuthenticationToken) authcToken;
			if (null == token || null == token.getUnion_id()){
				throw new AuthenticationException(Constants.AUTHEXCEPTION_ERRORTOKEN+"");
			}
			userEntity = userEntityMapper.getUsersByUnionId(token.getUnion_id());
		}
		else{
			throw new AuthenticationException(Constants.AUTHEXCEPTION_UNKOWNSOURCE+"");
		}
		
		if (userEntity == null || null == userEntity.getId()){
			throw new AuthenticationException(Constants.AUTHEXCEPTION_ACCOUNTNOTEXISTS+"");
		} else if(userEntity.getUser_status() != 0){
			throw new AuthenticationException(Constants.AUTHEXCEPTION_ACCOUNTDISABLED+"");
		}
		
		return new SimpleAuthenticationInfo(userEntity, userEntity.getPassword(), getName());
	}
	
	/**
	 * 设定Password校验的Hash算法与迭代次数.
	 */
	@PostConstruct
	public void initCredentialsMatcher() {
        setCredentialsMatcher(new CustomCredentialsMatcher());
    }
	/**
	 * 密码校验功能
	 */
	@Override
	protected void assertCredentialsMatch(AuthenticationToken token, AuthenticationInfo info)
			throws AuthenticationException {
//		super.assertCredentialsMatch(token, info);
	}
}
