package com.spring.dao;

import com.github.pagehelper.Page;
import com.spring.model.Emp;
import com.spring.model.Staff;
import com.spring.param.EmpFilter;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface EmpMapper {
    int deleteByPrimaryKey(String empId);

    int insert(Emp record);

    int insertSelective(Emp record);

    Emp selectByPrimaryKey(String empId);

    int updateByPrimaryKeySelective(Emp record);

    int updateByPrimaryKey(Emp record);

    Page<Staff> getAllEmp(RowBounds rowBounds);

    Staff getEmpByEmpId(String empId);

    int delete(String empId);

    int getCount();

    List<Staff> getEmpMessageByEmpName(String empName);

    int batchDelete(List<String> list);

    Page<Staff> getMessageByCondition(RowBounds rowBounds, EmpFilter filter);

    Integer getCountByFilter(String startTime);

    List<Emp> getMessage();

    int insertStaff(Staff staff);

    void cascadeUpdate(Staff staff);

    String getEmpNum();
}