package com.spring.model.permission;



import cn.afterturn.easypoi.excel.annotation.Excel;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{

    private static final long serialVersionUID = -1234175115794289602L;

    private String userId;

    @Excel(name = "用户名", isImportField = "true_user",width = 15)
    @NotNull
    private String userName;

    @Excel(name = "密码", isImportField = "true_user", width = 20)
    @NotNull
    private String userPassword;

    @Excel(name = "用户邮箱",isImportField = "true_user",width = 25)
    @Pattern(regexp = "^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.[a-zA-Z0-9]{2,6}$",message = "不是中文")
    private String email;

    @Excel(name = "电话",isImportField = "true_user",width = 15)
    @Pattern(regexp = "^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\\\\d{8}$",message = "不是中文")
    private String phone;

    @Excel(name = "加入时间",databaseFormat = "yyyy-MM-dd HH:mm:ss",format = "yyyy-MM-dd HH:mm:ss",isImportField = "true_user",width = 20)
    private Date createTime;

    private Date updateTime;

    @Excel(name = "是否启用",replace = {"已_1","未_0"},suffix = "启用",isImportField = "true_user")
    @NotNull
    private Integer status;

    @Excel(name = "描述",width = 30)
    private String remark;

    public User() {
    }

    public User(String userId, String userName, String userPassword, String email, String phone, Date createTime, Date updateTime, Integer status, String remark) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.email = email;
        this.phone = phone;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.status = status;
        this.remark = remark;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}