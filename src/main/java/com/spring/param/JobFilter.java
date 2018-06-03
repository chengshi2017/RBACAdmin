package com.spring.param;

/**
 * @Author: Jeremy
 * @Date: 2018/5/18
 * @Time: 21:05
 * @Version: 1.0
 * @Describe:
 */
public class JobFilter {

    private Integer pageNo;

    private Integer pageSize;

    private String jobName;

    private String deptId;

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

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }
}
