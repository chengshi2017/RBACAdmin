package com.spring.common.exceptions;

/**
 * @Author: Jeremy
 * @Date: 2018/6/3
 * @Time: 17:53
 * @Version: 1.0
 * @Describe:
 */
public class AbstractException extends RuntimeException{

    private static final long serialVersionUID = -895800631092994278L;

    public AbstractException(String message){
        super(message);
    }
}
