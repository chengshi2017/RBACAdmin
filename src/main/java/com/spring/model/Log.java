package com.spring.model;

import cn.afterturn.easypoi.excel.annotation.Excel;

import java.util.Date;

public class Log {
    private String logId;

    private String logTypeId;

    private String userId;

    @Excel(name = "操作用户",isImportField = "true_log")
    private String userName;

    @Excel(name = "日志类型", isImportField = "true_log")
    private String typeName;

    @Excel(name = "登录IP",width = 20)
    private String ip;

    @Excel(name = "操作时间", databaseFormat = "yyyy-MM-dd HH:mm:ss", format = "yyyy-MM-dd HH:mm:ss",isImportField = "true_log",width = 20)
    private Date operateTime;

    @Excel(name = "请求URL", width = 25, isImportField = "true_log")
    private String requestUrl;

    @Excel(name = "相应状态",replace = {"成功_0","失败_100"}, isImportField = "true_log")
    private String responseCode;

    @Excel(name = "是否有效", replace = {"有_1","无_2"},suffix = "效",isImportField = "true_log")
    private Integer status;

    @Excel(name = "描述", isImportField = "true_log")
    private String remark;

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getLogId() {
        return logId;
    }

    public void setLogId(String logId) {
        this.logId = logId;
    }

    public String getLogTypeId() {
        return logTypeId;
    }

    public void setLogTypeId(String logTypeId) {
        this.logTypeId = logTypeId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public String getRequestUrl() {
        return requestUrl;
    }

    public void setRequestUrl(String requestUrl) {
        this.requestUrl = requestUrl == null ? null : requestUrl.trim();
    }

    public String getResponseCode() {
        return responseCode;
    }

    public void setResponseCode(String responseCode) {
        this.responseCode = responseCode == null ? null : responseCode.trim();
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