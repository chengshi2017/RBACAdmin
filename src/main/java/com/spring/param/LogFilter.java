package com.spring.param;

/**
 * @Author: Jeremy
 * @Date: 2018/5/12
 * @Time: 21:16
 * @Version: 1.0
 * @Describe:
 */
public class LogFilter {

    private String startTime;

    private String endTime;

    private String typeName;

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

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
