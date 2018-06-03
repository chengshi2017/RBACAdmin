package com.spring.service.emp;

import com.github.pagehelper.Page;
import com.spring.model.Emp;
import com.spring.model.Staff;
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

    Page<Staff> getAllEmp(RowBounds rowBounds);

    Staff getEmpByEmpId(String empId);

    void insert(Staff staff);

    void update(Emp emp);

    void delete(String empId);

    List<Staff> getEmpMessageByEmpName(String empName);

    void batchDelete(List<String> list);

    Page<Emp> getMessageByCondition(RowBounds rowBounds, EmpFilter filter);

    Integer getCountByFilter(Integer count);

    List<Emp> getMessage();
}
