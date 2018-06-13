package com.spring.common.quartz.util;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.stereotype.Component;

/**
 * @Author: Jeremy
 * @Date: 2018/6/13
 * @Time: 15:27
 * @Version: 1.0
 * @Describe:
 */

@Component
public class SpringUtil implements BeanFactoryPostProcessor {

    private static ConfigurableListableBeanFactory beanFactory;

    public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
        this.beanFactory = beanFactory;
    }

    public static Object getBean(String name) {
        return beanFactory.getBean(name);
    }
    public static <T> T getBean(Class<T> clazz){
        return beanFactory.getBean(clazz);
    }
}
