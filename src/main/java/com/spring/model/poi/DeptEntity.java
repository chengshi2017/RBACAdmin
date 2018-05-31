package com.spring.model.poi;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelCollection;

import java.io.Serializable;
import java.util.List;

/**
 * @Author: Jeremy
 * @Date: 2018/5/29
 * @Time: 7:38
 * @Version: 1.0
 * @Describe:
 */
public class DeptEntity implements Serializable {

    private String deptId;

    @Excel(name = "部门名称",needMerge =true,width = 20)
    private String deptName;

    @ExcelCollection(name = "员工信息")
    private List<EmpEntity> list;

    public DeptEntity() {
    }

    public DeptEntity(String deptId, String deptName, List<EmpEntity> list) {
        this.deptId = deptId;
        this.deptName = deptName;
        this.list = list;
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

    public List<EmpEntity> getList() {
        return list;
    }

    public void setList(List<EmpEntity> list) {
        this.list = list;
    }
}
