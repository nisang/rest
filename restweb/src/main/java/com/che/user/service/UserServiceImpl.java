package com.che.user.service;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.che.user.entity.UserEntity;
import com.che.user.mapper.UserEntityMapper;
/**
 * 修改 
 * @author Administrator
 *
 */
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserEntityMapper userMapper;
    public UserEntity getUser() {
        Subject currentUser = SecurityUtils.getSubject();
		UserEntity user = (UserEntity) currentUser.getPrincipal();
        if(SecurityUtils.getSubject().isAuthenticated()){
            user = (UserEntity)SecurityUtils.getSubject().getPrincipal();
        }
        return user;
    }
    
    @Override
    public Long getUserId() {
        UserEntity userEntity = getUser();
        if(null != userEntity){
           return userEntity.getId(); 
        }
        return null;
    }

    @Override
    public String getSessionId() {
        String sessionId = null;
        Session session = SecurityUtils.getSubject().getSession();
        if( null != session){
            sessionId = session.getId().toString();
        }
        return sessionId;
    }

	@Override
	public UserEntity getUserByHxName(String hxUsername) {
		if(StringUtils.isEmpty(hxUsername)){
			return null;
		}
		return userMapper.queryUserbyhxName(hxUsername);
	}
	
	@Override
	public UserEntity getUserBySessionId(String sessioId){
		
		return null;
	}

	@Override
	public UserEntity getUserById(Long uid) {
		return null;
	}
    
}
