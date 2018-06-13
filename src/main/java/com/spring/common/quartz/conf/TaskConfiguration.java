package com.spring.common.quartz.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

/**
 * @Author: Jeremy
 * @Date: 2018/6/13
 * @Time: 15:22
 * @Version: 1.0
 * @Describe:
 */
@Configuration
@EnableScheduling
public class TaskConfiguration {

    @Bean
    public SchedulerFactoryBean schedulerFactoryBean(){
        return new SchedulerFactoryBean();
    }
}
