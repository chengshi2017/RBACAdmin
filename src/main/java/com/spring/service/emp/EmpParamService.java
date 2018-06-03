package com.spring.service.emp;

import com.spring.model.EmpParam;
import com.spring.model.Job;
import com.spring.model.Staff;

import java.util.List;

/**
 * @Author: Jeremy
 * @Date: 2018/5/16
 * @Time: 21:26
 * @Version: 1.0
 * @Describe:
 */
public interface EmpParamService {


    List<EmpParam> getAllByDeptId(String deptId);

    List<EmpParam> getJobMessageById(String jobId);

}
