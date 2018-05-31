package com.spring.dao;

import com.github.pagehelper.Page;
import com.spring.model.Dept;
import com.spring.model.poi.DeptEntity;
import com.spring.param.DeptFilter;
import org.apache.ibatis.session.RowBounds;

import java.util.Date;
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

    Page<Dept> getMessageByCondition(RowBounds rowBounds, DeptFilter filter);

    int batchDelete(List<String> list);

    int getCountByFilter(String startTime);

    List<DeptEntity> getMessage();
}