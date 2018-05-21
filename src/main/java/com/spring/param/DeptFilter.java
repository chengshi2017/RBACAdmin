package com.spring.param;

/**
 * @Author: Jeremy
 * @Date: 2018/5/16
 * @Time: 19:23
 * @Version: 1.0
 * @Describe:
 */
public class DeptFilter {

    private Integer pageNo;

    private Integer pageSize;

    private String startTime;

    private String endTime;

    private String deptName;

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

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }
}
