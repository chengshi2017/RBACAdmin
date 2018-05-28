package com.spring.common.Enums;

/**
 * @Author: Jeremy
 * @Date: 2018/5/25
 * @Time: 22:42
 * @Version: 1.0
 * @Describe:
 */
public enum SysTagEnums {
    USERID("userId","12370I6SDEA93003"), //系统管理员用户
    ROLEID("roleId","809281289969467392"),
    ;

    private String name;

    private String value;

    SysTagEnums(String name, String value) {
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
}
