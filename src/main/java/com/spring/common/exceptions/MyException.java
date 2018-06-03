package com.spring.common.exceptions;

/**
 * @Author 施成
 * @Date 2018/2/11
 * @time 1:20
 * @Describe: 自定义异常类
 */
public class MyException extends AbstractException {

    public MyException(String message) {
        super(message);
    }

}
