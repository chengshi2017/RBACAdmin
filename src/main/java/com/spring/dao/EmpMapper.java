package com.spring.dao;

import com.spring.model.Emp;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface EmpMapper {
    int deleteByPrimaryKey(String empId);

    int insert(Emp record);

    int insertSelective(Emp record);

    Emp selectByPrimaryKey(String empId);

    int updateByPrimaryKeySelective(Emp record);

    int updateByPrimaryKey(Emp record);

    List<Emp> getAllEmp(RowBounds rowBounds);

    Emp getEmpByEmpId(String empId);

    int delete(String empId);

    Integer getCount();

    List<Emp> getEmpMessageByEmpName(String empName);
}