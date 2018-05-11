package com.spring.param;

import java.util.Date;

/**
 * @Author: Jeremy
 * @Date: 2018/5/11
 * @Time: 14:39
 * @Version: 1.0
 * @Describe:
 */
public class UserFilter {

    private String userName;

    private String startTime;

    private String endTime;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}
