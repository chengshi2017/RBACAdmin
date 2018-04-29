package com.spring.common.Enums;

/**
 * @Author Sunny
 * @Date 2018/2/23
 * @time 1:50
 * @Describe: 状态码参数枚举
 */
public enum StatusEnums {

    VALID("valid",1), //有效
    INVALID("invalid",0),//无效
    ;

    private String name;
    private int value;

    StatusEnums(String name, int value) {
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }
}
