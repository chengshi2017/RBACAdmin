package com.spring.service.emp.impl;

import com.github.pagehelper.Page;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.Constants;
import com.spring.common.utils.DateUtils;
import com.spring.common.utils.UUID;
import com.spring.dao.*;
import com.spring.model.Dept;
import com.spring.model.Emp;
import com.spring.model.Job;
import com.spring.model.Staff;
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
import java.util.Date;
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

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public Page<Staff> getAllEmp(RowBounds rowBounds) {
        return empMapper.getAllEmp(rowBounds);
    }

    @Override
    public Staff getEmpByEmpId(String empId) {
        return empMapper.getEmpByEmpId(empId);
    }

    @Override
    public void insert(Staff staff) {
        //设置员工ID
        staff.setEmpId(UUID.getUUID());
        staff.setUserId(staff.getEmpId());
        //设置关联表ID
        staff.setEmpParamId(UUID.getUUID());
        //设置用户关联表ID
        staff.setUserRoleId(UUID.getUUID());
        staff.setUserName(staff.getEmpName());
        //为员工分配员工编号
        String empNum=empMapper.getEmpNum();
        String record=empNum.substring(empNum.length()-5,empNum.length());
        int count=Integer.parseInt(record);
        ++count;
        String empNumString=new DecimalFormat("00000").format(count);
        staff.setEmpNum("A"+empNumString);
        //设置用户状态
        //初步设想是插入员工信息，员工表中的状态由员工管理员设置
        //比如：员工状态设置为1，eStatus状态正常，但是员工不能登录系统，等到权限管理员或者
        //系统管理员将用户状态设为正常才允许登录，涉及到流程
        staff.setuStatus(Constants.NOT_STATUS);
        //设置插入系统时间
        staff.setCreateTime(new Date());
        //设置插入的用户为非管理员状态
        staff.setFlag(Constants.NOT_USER_ADMIN);
        //设置插入的用户默认的系统角色为员工角色
        staff.setRoleId(Constants.ROLE_STAFF);
        //设置插入员工角色表中的备注信息
        staff.setUserRoleRemark("用户员工关联信息");
        //向表中插入数据
        //先向员工表中插入数据
        if (empMapper.insertStaff(staff)<1){
            throw new MyException("插入员工信息失败");
        }
        //再向用户表中插入数据
        if (userMapper.insert(staff)<1){
            throw new MyException("插入用户信息失败");
        }        //再向员工信息关联表中插入数据
        if (empParamMapper.saveStaff(staff)<1){
            throw new MyException("插入员工关联信息失败");
        }
        //最后想用户角色关联表中插入数据
        if (userRoleMapper.save(staff)<1){
            throw new MyException("插入用户角色关联信息失败");
        }
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
    public List<Staff> getEmpMessageByEmpName(String empName) {
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

    @Override
    public List<Emp> getMessage() {
        return empMapper.getMessage();
    }
}
