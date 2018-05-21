package com.spring.dao;

import com.github.pagehelper.Page;
import com.spring.model.Emp;
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

    Page<Emp> getAllEmp(RowBounds rowBounds);

    Emp getEmpByEmpId(String empId);

    int delete(String empId);

    Integer getCount();

    List<Emp> getEmpMessageByEmpName(String empName);

    int batchDelete(List<String> list);

    Page<Emp> getMessageByCondition(RowBounds rowBounds, EmpFilter filter);
}