package com.spring.service.dept;

import com.github.pagehelper.Page;
import com.spring.model.Dept;
import com.spring.param.DeptFilter;
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

    Page<Dept> getMessageByCondition(RowBounds rowBounds, DeptFilter filter);

    void batchDelete(List<String> list);

    Integer getCountByFilter(Integer i);
}
