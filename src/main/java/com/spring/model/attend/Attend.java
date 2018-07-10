package com.spring.model.attend;

import cn.afterturn.easypoi.excel.annotation.Excel;

import java.util.Date;

public class Attend {

    private String userAttendId;

    private String userId;

    @Excel(name = "员工姓名",isImportField = "true_attend")
    private String userName;

    private String attendId;

    @Excel(name = "考勤日期",databaseFormat = "yyyy-MM-dd", format = "yyyy-MM-dd",isImportField = "true_attend",width = 18)
    private String attendDate;

    @Excel(name = "考勤周期",isImportField = "true_attend")
    private String attendWeek;

    @Excel(name = "上午打卡时间",databaseFormat = "yyyy-MM-dd HH:mm:ss", format = "yyyy-MM-dd HH:mm:ss",isImportField = "true_attend",width = 20)
    private Date attendMorning;

    @Excel(name = "下午打卡时间",databaseFormat = "yyyy-MM-dd HH:mm:ss", format = "yyyy-MM-dd HH:mm:ss",isImportField = "true_attend",width = 20)
    private Date attendEvening;

    @Excel(name = "工作时长",suffix = "小时")
    private Integer workHours;

    @Excel(name = "缺勤时长",suffix = "分钟",isImportField = "true_attend")
    private Integer absence;

    @Excel(name = "考勤状态",replace = {"正_1","异_0"}, suffix = "常",isImportField = "true_attend")
    private Integer attendStatus;

    @Excel(name = "备注",width = 25 )
    private String remark;

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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}