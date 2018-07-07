package com.spring.model;

import cn.afterturn.easypoi.excel.annotation.Excel;

import javax.validation.constraints.Pattern;
import java.util.Date;

/**
 * @Author: Jeremy
 * @Date: 2018/6/1
 * @Time: 9:39
 * @Version: 1.0
 * @Describe:
 */
public class Staff {

    private String userId;

    private String empId;

    private String empParamId;

    private String userRoleId;

    @Excel(name = "用户工号")
    private String empNum;

    @Excel(name = "用户姓名", isImportField = "true_emp")
    private String userName;

    private String empName;

    @Excel(name = "用户角色", isImportField = "true_emp")
    private String roleName;

    private String userPassword;

    @Excel(name = "用户性别",isImportField = "true_emp")
    private String sex;

    @Excel(name = "用户年龄")
    private Integer age;

    @Excel(name = "用户现居地址",width = 15)
    private String address;

    @Excel(name = "用户电话",width = 15)
    private String phone;

    @Excel(name = "邮箱",width = 25,isImportField = "true_emp")
    @Pattern(regexp = "^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.[a-zA-Z0-9]{2,6}$",message = "不是中文")
    private String email;

    @Excel(name = "民族")
    private String pace;

    private Date createTime;

    private Date updateTime;

    @Excel(name = "所属部门",isImportField = "true_emp", width = 20)
    private String deptName;

    @Excel(name = "所属职位",isImportField = "true_emp", width = 20)
    private String jobName;

    @Excel(name = "用户状态",replace = {"正_1","异_0"},suffix = "常", isImportField = "true_emp")
    private Integer uStatus;

    private Integer eStatus;

    private String remark;

    private String deptId;

    private String jobId;

    private boolean flag;

    private String roleId;

    private String userRoleRemark;

    public Staff() {
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public String getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(String userRoleId) {
        this.userRoleId = userRoleId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getEmpNum() {
        return empNum;
    }

    public void setEmpNum(String empNum) {
        this.empNum = empNum;
    }

    public Integer getuStatus() {
        return uStatus;
    }

    public void setuStatus(Integer uStatus) {
        this.uStatus = uStatus;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPace() {
        return pace;
    }

    public void setPace(String pace) {
        this.pace = pace;
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

    public Integer geteStatus() {
        return eStatus;
    }

    public void seteStatus(Integer eStatus) {
        this.eStatus = eStatus;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getEmpParamId() {
        return empParamId;
    }

    public void setEmpParamId(String empParamId) {
        this.empParamId = empParamId;
    }

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
        this.deptName = deptName;
    }

    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getUserRoleRemark() {
        return userRoleRemark;
    }

    public void setUserRoleRemark(String userRoleRemark) {
        this.userRoleRemark = userRoleRemark;
    }
}
