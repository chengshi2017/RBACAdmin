package com.spring.common.Enums;

/**
 * @Author Sunny
 * @Date 2018/2/23
 * @time 22:09
 * @Describe: 日志类型枚举
 */
public enum LogTypeEnums {

    LOGIN("login","808953751040688128l"), //登录日志
    OPERTE("operate","808953871287189504l"),//操作日志
    ;

    private String name;
    private String value;

    LogTypeEnums(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    //根据name获取value
    public String getValueByName(String name){
        for(LogTypeEnums logTypeEnum : LogTypeEnums.values()){
            if(logTypeEnum.getName().equals(name)){
                return logTypeEnum.getValue();
            }
        }
        return null;
    }
}
