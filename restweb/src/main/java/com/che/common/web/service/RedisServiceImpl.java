package com.che.common.web.service;

import java.io.UnsupportedEncodingException;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;


@Service(value = "redisService")
public class RedisServiceImpl implements RedisService {

	@Autowired
	private RedisTemplate<String, Object> redisTemplate;

	@Override
	public void put(String hashkey, String value) {
		Boolean hasKey = redisTemplate.opsForHash().hasKey(RedisConstant.DC_KEY_COMMON, hashkey);
		if (hasKey) {
			redisTemplate.opsForHash().delete(RedisConstant.DC_KEY_COMMON, hashkey);
		}
		redisTemplate.opsForHash().put(RedisConstant.DC_KEY_COMMON, hashkey, value);
		redisTemplate.expire(RedisConstant.DC_KEY_COMMON, 10, TimeUnit.MINUTES); // 过期时间10分钟
	}

	@Override
	public String get(String hashkey) {
		return (String) redisTemplate.opsForHash().get(RedisConstant.DC_KEY_COMMON, hashkey);
	}

	@Override
	public boolean hasKey(String hashkey) {
		if (StringUtils.isBlank(hashkey)) {
			return false;
		}
		return redisTemplate.opsForHash().hasKey(RedisConstant.DC_KEY_COMMON, hashkey);
	}

	@Override
	public void claerHasKey(String hashkey) {
		Boolean hasKey = redisTemplate.opsForHash().hasKey(RedisConstant.DC_KEY_COMMON, hashkey);
		if (hasKey) {
			redisTemplate.opsForHash().delete(RedisConstant.DC_KEY_COMMON, hashkey);
		}
	}

	public String getSetString(final String key) throws UnsupportedEncodingException {
		return (String) redisTemplate.opsForValue().get(key);
	}
}
