package com.spring.service.dept.impl;

import com.github.pagehelper.Page;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.Constants;
import com.spring.common.utils.DateUtils;
import com.spring.common.utils.UUID;
import com.spring.dao.DeptMapper;
import com.spring.dao.EmpParamMapper;
import com.spring.model.Dept;
import com.spring.model.EmpParam;
import com.spring.param.DeptFilter;
import com.spring.service.dept.DeptService;
import net.sf.ehcache.search.aggregator.Count;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @Author 施成
 * @Date 2018/2/11
 * @time 9:32
 * @Describe:
 */
@Service
@Transactional
public class DeptServiceImpl implements DeptService{

    @Autowired
    private DeptMapper deptMapper;

    @Autowired
    private EmpParamMapper empParamMapper;

    @Override
    public Page<Dept> getAllDeptMessage(RowBounds rowBounds) {
        return deptMapper.getAllDeptMessage(rowBounds);
    }

    @Override
    public Dept getDeptById(String deptId) {
        return deptMapper.selectByPrimaryKey(deptId);
    }

    @Override
    public void insert(Dept info) {
        //生成唯一标识符
        info.setDeptId(UUID.getUUID());
        //获取当前创建时间
        info.setCreateTime(DateUtils.today());
        if (deptMapper.insert(info)<1){
            throw new MyException("新增部门信息失败！");
        }
    }

    @Override
    public void update(Dept info) {

        info.setUpdateTime(DateUtils.today());
        if(deptMapper.updateByPrimaryKeySelective(info)<1){
            throw new MyException("修改部门信息失败！");
        }

    }

    @Override
    public void delete(String deptId) {
        if (deptMapper.deleteByPrimaryKey(deptId)<1){
            throw new MyException("删除部门信息失败!");
        }
    }

    @Override
    public List<Dept> getAllDept() {
        return deptMapper.getAllDept();
    }

    @Override
    public Page<Dept> getMessageByCondition(RowBounds rowBounds, DeptFilter filter) {
        return deptMapper.getMessageByCondition(rowBounds,filter);
    }

    @Override
    public void batchDelete(List<String> list) {
        if (deptMapper.batchDelete(list)<1){
            throw new MyException("批量删除部门信息失败");
        }
    }

    @Override
    public Integer getCountByFilter(Integer filter) {
        String startTime = null;
        Integer count;
        if (filter == null){
            count=deptMapper.getCountByFilter(startTime);
        }else {
            startTime=DateUtils.getDateTime(filter);
            count=deptMapper.getCountByFilter(startTime);
        }
        return count;
    }
}
