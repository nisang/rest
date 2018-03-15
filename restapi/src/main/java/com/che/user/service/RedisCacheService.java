package com.che.user.service;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.che.user.entity.ValidateEntity;
@Service
@Cacheable("redisCache")
public class RedisCacheService {
	
	@Cacheable(value="smsCode#900")
	public ValidateEntity saveSmsCode(ValidateEntity smsCode){
		return smsCode;
	}
	
	@Cacheable(value="smsCode")
	public ValidateEntity findSmsCode(ValidateEntity smsCode){
		return smsCode;
	}

}
