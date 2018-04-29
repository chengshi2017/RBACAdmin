package com.spring;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @Author: Sunny
 * @Date: 2018/4/7
 * @Time: 12:16
 * @Version: 1.0
 * @Describe:
 */
@SpringBootApplication
@MapperScan(basePackages ="com.spring.dao")
@EnableTransactionManagement
public class Application {

    public static void main(String[] args){
        SpringApplication.run(Application.class,args);
    }

}
