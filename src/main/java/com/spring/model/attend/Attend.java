package com.spring.model.attend;

import java.util.Date;

public class Attend {

    private String userAttendId;

    private String userId;

    private String remark;

    private String attendId;

    private String attendDate;

    private String attendWeek;

    private Date attendMorning;

    private Date attendEvening;

    private Integer absence;

    private Integer attendStatus;

    private Integer workHours;

    public Attend(String attendId, String attendDate, String attendWeek, Date attendMorning, Date attendEvening, Integer absence, Integer attendStatus) {
        this.attendId = attendId;
        this.attendDate = attendDate;
        this.attendWeek = attendWeek;
        this.attendMorning = attendMorning;
        this.attendEvening = attendEvening;
        this.absence = absence;
        this.attendStatus = attendStatus;
    }

    public Attend() {
        super();
    }

    public String getUserAttendId() {
        return userAttendId;
    }

    public void setUserAttendId(String userAttendId) {
        this.userAttendId = userAttendId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getAttendId() {
        return attendId;
    }

    public void setAttendId(String attendId) {
        this.attendId = attendId == null ? null : attendId.trim();
    }

    public String getAttendDate() {
        return attendDate;
    }

    public void setAttendDate(String attendDate) {
        this.attendDate = attendDate;
    }

    public String getAttendWeek() {
        return attendWeek;
    }

    public void setAttendWeek(String attendWeek) {
        this.attendWeek = attendWeek;
    }

    public Date getAttendMorning() {
        return attendMorning;
    }

    public void setAttendMorning(Date attendMorning) {
        this.attendMorning = attendMorning;
    }

    public Date getAttendEvening() {
        return attendEvening;
    }

    public void setAttendEvening(Date attendEvening) {
        this.attendEvening = attendEvening;
    }

    public Integer getAbsence() {
        return absence;
    }

    public void setAbsence(Integer absence) {
        this.absence = absence;
    }

    public Integer getAttendStatus() {
        return attendStatus;
    }

    public void setAttendStatus(Integer attendStatus) {
        this.attendStatus = attendStatus;
    }

    public Integer getWorkHours() {
        return workHours;
    }

    public void setWorkHours(Integer workHours) {
        this.workHours = workHours;
    }
}