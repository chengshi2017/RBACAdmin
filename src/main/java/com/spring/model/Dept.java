package com.spring.model;

import java.util.Date;

public class Dept {
    private String deptId;

    private String deptName;

    private Date createTime;

    private Date updateTime;

    private Integer status;

    private String deptRemark;

    private String deptLeaderId;

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDeptRemark() {
        return deptRemark;
    }

    public void setDeptRemark(String deptRemark) {
        this.deptRemark = deptRemark == null ? null : deptRemark.trim();
    }

    public String getDeptLeaderId() {
        return deptLeaderId;
    }

    public void setDeptLeaderId(String deptLeaderId) {
        this.deptLeaderId = deptLeaderId == null ? null : deptLeaderId.trim();
    }
}