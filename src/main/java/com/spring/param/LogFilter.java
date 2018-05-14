package com.spring.param;

/**
 * @Author: Jeremy
 * @Date: 2018/5/12
 * @Time: 21:16
 * @Version: 1.0
 * @Describe:
 */
public class LogFilter {

    private Integer pageNo;

    private Integer pageSize;

    private String startTime;

    private String endTime;

    private String logTypeId;

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

    public String getLogTypeId() {
        return logTypeId;
    }

    public void setLogTypeId(String logTypeId) {
        this.logTypeId = logTypeId;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
