package com.spring.common.redis;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * @Author: Sunny
 * @Date: 2018/4/28
 * @Time: 13:27
 * @Version: 1.0
 * @Describe:
 */
public class RedisCacheManager implements CacheManager {
    private static final Logger logger = LoggerFactory.getLogger(RedisCacheManager.class);
    private final ConcurrentMap<String, Cache> caches = new ConcurrentHashMap();
    private RedisManager redisManager;
    private String keyPrefix = "shiro_redis_cache:";

    public RedisCacheManager() {
    }

    public String getKeyPrefix() {
        return this.keyPrefix;
    }

    public void setKeyPrefix(String keyPrefix) {
        this.keyPrefix = keyPrefix;
    }

    public <K, V> Cache<K, V> getCache(String name) throws CacheException {
        logger.debug("获取名称为: " + name + " 的RedisCache实例");
        Cache c = (Cache)this.caches.get(name);
        if (c == null) {
            this.redisManager.init();
            c = new RedisCache(this.redisManager, this.keyPrefix);
            this.caches.put(name, c);
        }

        return (Cache)c;
    }

    public RedisManager getRedisManager() {
        return this.redisManager;
    }

    public void setRedisManager(RedisManager redisManager) {
        this.redisManager = redisManager;
    }

}
