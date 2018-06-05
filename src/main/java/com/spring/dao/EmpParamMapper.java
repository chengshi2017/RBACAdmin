package com.spring.dao;

import com.spring.model.Emp;
import com.spring.model.EmpParam;
import com.spring.model.Staff;

import java.util.List;

public interface EmpParamMapper {
    int deleteByPrimaryKey(String empParamId);

    int insert(EmpParam record);

    int insertSelective(EmpParam record);

    EmpParam selectByPrimaryKey(String empParamId);

    int updateByPrimaryKeySelective(Emp record);

    int updateByPrimaryKey(Emp record);

    void save(Emp emp);

    List<EmpParam> getAllByDeptId(String deptId);

    List<EmpParam> getAllByJobId(String jobId);

    int saveStaff(Staff staff);

    Integer getCountByJobId(String jobId);
}