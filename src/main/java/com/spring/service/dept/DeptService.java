package com.spring.service.dept;

import com.github.pagehelper.Page;
import com.spring.model.Dept;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

/**
 * @Author 施成
 * @Date 2018/2/11
 * @time 9:31
 * @Describe:
 */
public interface DeptService {
    Page<Dept> getAllDeptMessage(RowBounds rowBounds);

    Dept getDeptById(String deptId);

    void insert(Dept info);

    void update(Dept info);

    void delete(String deptId);

    List<Dept> getAllDept();
}
