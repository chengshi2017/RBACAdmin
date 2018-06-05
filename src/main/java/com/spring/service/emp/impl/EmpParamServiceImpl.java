package com.spring.service.emp.impl;

import com.spring.dao.EmpParamMapper;
import com.spring.model.EmpParam;
import com.spring.service.emp.EmpParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Jeremy
 * @Date: 2018/5/16
 * @Time: 21:31
 * @Version: 1.0
 * @Describe:
 */
@Service
public class EmpParamServiceImpl implements EmpParamService{

    @Autowired
    private EmpParamMapper empParamMapper;

    @Override
    public List<EmpParam> getAllByDeptId(String deptId) {
        return empParamMapper.getAllByDeptId(deptId);
    }

    @Override
    public List<EmpParam> getJobMessageById(String jobId) {
        return empParamMapper.getAllByJobId(jobId);
    }

    @Override
    public Integer getCountByJobId(String jobId) {
        return empParamMapper.getCountByJobId(jobId);
    }
}
