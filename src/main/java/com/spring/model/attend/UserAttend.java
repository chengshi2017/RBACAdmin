package com.spring.model.attend;

public class UserAttend {
    private String userAttendId;

    private String userId;

    private String attendId;

    private String remark;

    public UserAttend(String userAttendId, String userId, String attendId, String remark) {
        this.userAttendId = userAttendId;
        this.userId = userId;
        this.attendId = attendId;
        this.remark = remark;
    }

    public UserAttend() {
        super();
    }

    public String getUserAttendId() {
        return userAttendId;
    }

    public void setUserAttendId(String userAttendId) {
        this.userAttendId = userAttendId == null ? null : userAttendId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getAttendId() {
        return attendId;
    }

    public void setAttendId(String attendId) {
        this.attendId = attendId == null ? null : attendId.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}