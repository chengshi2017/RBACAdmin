package com.spring.service.emp.impl;

import com.github.pagehelper.Page;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.DateUtils;
import com.spring.common.utils.UUID;
import com.spring.dao.DeptMapper;
import com.spring.dao.EmpMapper;
import com.spring.dao.EmpParamMapper;
import com.spring.dao.JobMapper;
import com.spring.model.Dept;
import com.spring.model.Emp;
import com.spring.model.Job;
import com.spring.param.EmpFilter;
import com.spring.service.emp.EmpService;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.text.DecimalFormat;
import java.util.List;

/**
 * @Author Sunny
 * @Date 2018/3/1
 * @time 10:41
 * @Describe:
 */
@Service
@Transactional
public class EmpServiceImpl implements EmpService{

    private static final Logger LOGGER= LoggerFactory.getLogger(EmpServiceImpl.class);

    @Autowired
    private EmpMapper empMapper;

    @Autowired
    private EmpParamMapper empParamMapper;

    @Autowired
    private DeptMapper deptMapper;

    @Autowired
    private JobMapper jobMapper;

    @Override
    public Page<Emp> getAllEmp(RowBounds rowBounds) {
        return empMapper.getAllEmp(rowBounds);
    }

    @Override
    public Emp getEmpByEmpId(String empId) {
        return empMapper.getEmpByEmpId(empId);
    }

    @Override
    public void insert(Emp emp) {
        Integer count=empMapper.getCount();
        ++count;
        emp.setEmpId(UUID.getUUID());
        emp.setEmpNum(new DecimalFormat("000000").format(count));
        emp.setEmpParamId(UUID.getUUID());
        emp.setCreateTime(DateUtils.today());
        String deptName=emp.getDeptName();
        //根据部门名称查询部门信息
        List<Dept> deptList=deptMapper.getDeptMessageByDeptName(deptName);
        emp.setDeptId(deptList.get(0).getDeptId());
        //根据前台传递的jobName查询jobId
        String jobName=emp.getJobName();
        List<Job> jobList=jobMapper.getAllJobByJobName(jobName);
        emp.setJobId(jobList.get(0).getJobId());
        //先增加参数表内的数据
        empParamMapper.save(emp);
        //向主表中添加数据
        empMapper.insert(emp);
    }

    @Override
    public void update(Emp emp) {
        emp.setUpdateTime(DateUtils.today());

        String deptName=emp.getDeptName();
        if(deptName!=null&&!"".equals(deptName)){
            List<Dept> deptList=deptMapper.getDeptMessageByDeptName(deptName);
            emp.setDeptId(deptList.get(0).getDeptId());
        }

        String jobName=emp.getJobName();
        if(jobName!=null&&!"".equals(jobName)){
            List<Job> jobList=jobMapper.getAllJobByJobName(jobName);
            emp.setJobId(jobList.get(0).getJobId());
        }
        empParamMapper.updateByPrimaryKeySelective(emp);
        empMapper.updateByPrimaryKeySelective(emp);
    }

    @Override
    public void delete(String empId) {
        if(empMapper.delete(empId)<1){
            throw new MyException("删除员工信息失败");
        }
    }

    @Override
    public List<Emp> getEmpMessageByEmpName(String empName) {
        return empMapper.getEmpMessageByEmpName(empName);
    }

    @Override
    public void batchDelete(List<String> list) {
        if (list!=null&&list.size()>0){
            if (empMapper.batchDelete(list)<1){
                throw new MyException("批量删除员工信息失败！");
            }
        }else {
            throw new MyException("要删除的员工信息为空");
        }
    }

    @Override
    public Page<Emp> getMessageByCondition(RowBounds rowBounds, EmpFilter filter) {
        Integer startYear=filter.getStartYear();
        Integer endYear=filter.getEndYear();
        if (startYear!=null) {
            String startTime = DateUtils.getLimitTime(startYear);
            filter.setStartTime(startTime);
        }
        if (endYear!=null){
            String endTime = DateUtils.getLimitTime(endYear);
            filter.setEndTime(endTime);
        }
        Page<Emp> lists=empMapper.getMessageByCondition(rowBounds,filter);
        return lists;
    }

    @Override
    public Integer getCountByFilter(Integer filter) {
        String startTime = null;
        Integer count;
        if (filter == null){
            count=empMapper.getCountByFilter(startTime);
        }else {
            startTime=DateUtils.getDateTime(filter);
            count=empMapper.getCountByFilter(startTime);
        }
        return count;
    }
}
