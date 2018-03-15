package com.che.user.service;

import com.che.user.entity.UserEntity;

public interface UserService {
    
    /**
     * 获取当前登录用户entity
     */
    public UserEntity getUser();
    
    /**
     * 获取当前登录用户id
     */
    public Long getUserId();
    
    /**
     * 获取当前SesssionId
     */
    public String getSessionId();
    
    /**
     * 根据环信用户名查询用户信息
     * @return
     */
    public UserEntity getUserByHxName(String hxUsername);
    
    public UserEntity getUserBySessionId(String sessinId);
    
    public UserEntity getUserById(Long uid);
    
}
