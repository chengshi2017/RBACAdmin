package com.spring.dao;

import com.github.pagehelper.Page;
import com.spring.model.Dept;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface DeptMapper {
    int deleteByPrimaryKey(String deptId);

    int insert(Dept record);

    int insertSelective(Dept record);

    Dept selectByPrimaryKey(String deptId);

    int updateByPrimaryKeySelective(Dept record);

    int updateByPrimaryKey(Dept record);

    Page<Dept> getAllDeptMessage(RowBounds rowBounds);

    List<Dept> getAllDept();

    List<Dept> getDeptMessageByDeptName(String deptName);
}