package com.spring.model.poi;




import cn.afterturn.easypoi.excel.annotation.Excel;

import javax.validation.constraints.Pattern;
import java.io.Serializable;

/**
 * @Author: Jeremy
 * @Date: 2018/5/28
 * @Time: 16:15
 * @Version: 1.0
 * @Describe:
 */
public class EmpEntity implements Serializable{

    /**
     * 员工编号
     */

    private String empId;

    /**
     * 员工工号
     */
    @Excel(name = "员工工号")
    private String empNum;

    @Excel(name = "员工姓名", isImportField = "true_emp")
    private String empName;

    @Excel(name = "性别",isImportField = "true_emp")
    private String sex;

    @Excel(name = "年龄")
    private Integer age;

    @Excel(name = "地址",width = 15)
    private String address;

    @Excel(name = "电话号码",width = 15)
    private String phone;

    @Excel(name = "邮箱",width = 25,isImportField = "true_emp")
    @Pattern(regexp = "^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.[a-zA-Z0-9]{2,6}$",message = "不是中文")
    private String email;

    @Excel(name = "职位名称",isImportField = "true_emp", width = 20)
    private String jobName;

    @Excel(name = "民族")
    private String pace;

    @Excel(name = "入职时间", databaseFormat = "yyyy-MM-dd HH:mm:ss", format = "yyyy-MM-dd HH:mm:ss",isImportField = "true_emp",width = 20)
    private String createTime;

    @Excel(name = "员工状态",replace = {"正_1","异_0"},suffix = "常", isImportField = "true_emp")
    private String status;

    public EmpEntity(String empId, String empNum, String empName, String sex, Integer age, String address, String phone, String email, String pace, String createTime, String status, String jobName) {
        this.empId = empId;
        this.empNum = empNum;
        this.empName = empName;
        this.sex = sex;
        this.age = age;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.pace = pace;
        this.createTime = createTime;
        this.status = status;
        this.jobName = jobName;
    }

    public EmpEntity() {
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public String getEmpNum() {
        return empNum;
    }

    public void setEmpNum(String empNum) {
        this.empNum = empNum;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
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

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }
}
