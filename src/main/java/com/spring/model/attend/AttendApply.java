package com.spring.model.attend;

public class AttendApply {
    private String attendReattendId;

    private String attendId;

    private String reAttendId;

    private Integer status;

    private String remark;

    public AttendApply(String attendReattendId, String attendId, String reAttendId, Integer status, String remark) {
        this.attendReattendId = attendReattendId;
        this.attendId = attendId;
        this.reAttendId = reAttendId;
        this.status = status;
        this.remark = remark;
    }

    public AttendApply() {
        super();
    }

    public String getAttendReattendId() {
        return attendReattendId;
    }

    public void setAttendReattendId(String attendReattendId) {
        this.attendReattendId = attendReattendId == null ? null : attendReattendId.trim();
    }

    public String getAttendId() {
        return attendId;
    }

    public void setAttendId(String attendId) {
        this.attendId = attendId == null ? null : attendId.trim();
    }

    public String getReAttendId() {
        return reAttendId;
    }

    public void setReAttendId(String reAttendId) {
        this.reAttendId = reAttendId == null ? null : reAttendId.trim();
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