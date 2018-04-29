package com.spring.model;

public class EmpParam {
    private String empParamId;

    private String empId;

    private String deptId;

    private String jobId;

    private Integer status;

    private String remark;

    public String getEmpParamId() {
        return empParamId;
    }

    public void setEmpParamId(String empParamId) {
        this.empParamId = empParamId == null ? null : empParamId.trim();
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId == null ? null : empId.trim();
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId == null ? null : deptId.trim();
    }

    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId == null ? null : jobId.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}