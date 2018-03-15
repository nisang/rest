package com.che.common.web.service;

/**
 * 缓存服务
 * @author zhoufy
 */
public interface RedisService {
	
    /**
     * 添加key-value至redis
     * @param hashkey 	redis中的hash_key
     * @param value 	value值
     */
    public void put(String hashkey, String value);
    
    /**
     * 获取redis中的value值
     * @param hashkey 	redis中的hash_key
     */
    public String get(String hashkey);
    
    /**
     * 判断redis中是否有hashkey
     */
    public boolean hasKey(String hashkey);
    
    /**
     * 清除redis里的hashkey
     */
    public void claerHasKey(String hashkey);
}
