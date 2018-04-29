package com.spring.service.emp;

import com.spring.model.Emp;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

/**
 * @Author Sunny
 * @Date 2018/3/1
 * @time 10:23
 * @Describe:
 */
public interface EmpService {

    List<Emp> getAllEmp(RowBounds rowBounds);

    Emp getEmpByEmpId(String empId);

    void insert(Emp emp);

    void update(Emp emp);

    void delete(String empId);

    List<Emp> getEmpMessageByEmpName(String empName);
}
