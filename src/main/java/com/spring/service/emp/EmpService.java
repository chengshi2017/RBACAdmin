package com.spring.service.emp;

import com.github.pagehelper.Page;
import com.spring.model.Emp;
import com.spring.param.EmpFilter;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

/**
 * @Author Sunny
 * @Date 2018/3/1
 * @time 10:23
 * @Describe:
 */
public interface EmpService {

    Page<Emp> getAllEmp(RowBounds rowBounds);

    Emp getEmpByEmpId(String empId);

    void insert(Emp emp);

    void update(Emp emp);

    void delete(String empId);

    List<Emp> getEmpMessageByEmpName(String empName);

    void batchDelete(List<String> list);

    Page<Emp> getMessageByCondition(RowBounds rowBounds, EmpFilter filter);
}
