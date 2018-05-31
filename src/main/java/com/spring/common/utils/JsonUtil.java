package com.spring.common.utils;

import com.alibaba.fastjson.JSON;

import java.util.List;

/**
 * @Author: Jeremy
 * @Date: 2018/5/30
 * @Time: 12:08
 * @Version: 1.0
 * @Describe:
 */
public class JsonUtil {

    public static <T> String beanToString(T value) {
        if (value == null) {
            return null;
        }
        Class<?> clazz = value.getClass();
        if (clazz == int.class || clazz == Integer.class) {
            return "" + value;
        } else if (clazz == String.class) {
            return (String) value;
        } else if (clazz == long.class || clazz == Long.class) {
            return "" + value;
        } else {
            return JSON.toJSONString(value);
        }
    }

    public static <T> T stringToBean(String str, Class<T> clazz) {
        if (str == null || str.length() <= 0 || clazz == null) {
            return null;
        }
        if (clazz == int.class || clazz == Integer.class) {
            return (T) Integer.valueOf(str);
        } else if (clazz == String.class) {
            return (T) str;
        } else if (clazz == long.class || clazz == Long.class) {
            return (T) Long.valueOf(str);
        } else {
            return JSON.toJavaObject(JSON.parseObject(str), clazz);
        }
    }

    /**
     * @Description: json字符串转换为对应的(clazz)对象集合
     * @Param: [str, clazz]
     * @Retrun: java.util.List<T>
     */
    public static <T> List<T> stringToList(String str, Class<T> clazz) {
        return JSON.parseArray(str, clazz);
    }

}
