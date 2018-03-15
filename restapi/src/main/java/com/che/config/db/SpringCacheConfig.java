//package com.che.config.db;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.cache.CacheManager;
//import org.springframework.cache.annotation.CachingConfigurerSupport;
//import org.springframework.cache.annotation.EnableCaching;
//import org.springframework.cache.interceptor.CacheErrorHandler;
//import org.springframework.cache.interceptor.CacheResolver;
//import org.springframework.cache.interceptor.KeyGenerator;
//import org.springframework.cache.interceptor.SimpleCacheErrorHandler;
//import org.springframework.cache.interceptor.SimpleCacheResolver;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.data.redis.core.RedisTemplate;
//
//import com.che.spring.springcache.cache.ExpiresRedisCacheManager;
//import com.che.spring.springcache.key.CheRedisCacheKeyGenerator;
//
//@Configuration
//@EnableCaching
//public class SpringCacheConfig extends CachingConfigurerSupport{
//
//	@Autowired
//	private RedisTemplate redisTemplate;
//	
//	@Autowired
//	private RedisConfig redisConfig;
//	
//	@Override
//	@Bean
//	public CacheManager cacheManager() {
//		ExpiresRedisCacheManager cacheManager = new ExpiresRedisCacheManager(redisTemplate, "carsource");
//		return cacheManager;
//	}
//	
//	
//	@Override
//	@Bean
//	public KeyGenerator keyGenerator() {
//		return new CheRedisCacheKeyGenerator("carsource");
//	}
//	
//	@Override
//	@Bean
//	public CacheResolver cacheResolver() {
//		SimpleCacheResolver resolver = new SimpleCacheResolver();
//		resolver.setCacheManager(this.cacheManager());
//		return resolver; 
//	}
//	
//	@Override
//	@Bean
//	public CacheErrorHandler errorHandler() {
//		return new SimpleCacheErrorHandler();
//	}
//	
//}
