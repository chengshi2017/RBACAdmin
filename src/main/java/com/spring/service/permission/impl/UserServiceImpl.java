package com.spring.service.permission.impl;

import com.alibaba.druid.sql.visitor.functions.Substring;
import com.github.pagehelper.Page;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.Constants;
import com.spring.common.utils.DateUtils;
import com.spring.common.utils.EncodeMD5;
import com.spring.common.utils.UUID;
import com.spring.dao.EmpMapper;
import com.spring.dao.EmpParamMapper;
import com.spring.dao.UserMapper;
import com.spring.dao.UserRoleMapper;
import com.spring.model.Staff;
import com.spring.model.permission.User;
import com.spring.model.permission.UserRole;
import com.spring.param.UserFilter;
import com.spring.service.emp.EmpParamService;
import com.spring.service.permission.UserService;
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
 * @Author 施成
 * @Date 2018/2/20
 * @time 1:20
 * @Describe:
 */
@Service
public class UserServiceImpl implements UserService{

    private static final Logger Log= LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Autowired
    private EmpMapper empMapper;

    @Autowired
    private EmpParamMapper empParamMapper;

    @Override
    public Page<Staff> getAllUserMessage(RowBounds rowBounds, UserFilter filter) {
        return userMapper.getAll(rowBounds,filter);
    }

    @Override
    public Staff getUserMessageById(String userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    public void insert(Staff staff) {
        //设置用户UUID
        staff.setUserId(UUID.getUUID());
        staff.setEmpId(staff.getUserId());
        //设置关联表uuid
        staff.setEmpParamId(UUID.getUUID());
        //设置员工名
        staff.setEmpName(staff.getUserName());
        //为员工分配员工编号
        String empNum=empMapper.getEmpNum();
        String record=empNum.substring(empNum.length()-5,empNum.length());
        int count=Integer.parseInt(record);
        ++count;
        String empNumString=new DecimalFormat("00000").format(count);
        staff.setEmpNum("A"+empNumString);
        //设置员工状态
        staff.seteStatus(staff.getuStatus());
        //获取当前时间
        staff.setCreateTime(new Date());
        //密码加密
        staff.setUserPassword(EncodeMD5.GetMD5Code(staff.getUserPassword()));
        //设置部门ID，从用户处添加的员工自动添加到HR部门，角色动态分配
        //从员工处添加的信息可以选择多个部门，但是角色为员工角色
        staff.setDeptId(Constants.DEPT_HR_ID);
        //设置flag,当从用户管理处添加时设置为是管理员账户
        //从员工管理处添加设置为普通用户
        staff.setFlag(Constants.IS_USER_ADMIN);
        //先向用户表中插入数据
        if(userMapper.insert(staff)<1){
            throw new MyException("新增用户信息失败！");
        }
        //再向员工表中插入数据
        if (empMapper.insertStaff(staff)<1){
            throw new MyException("新增员工信息失败！");
        }
        //
        if (empParamMapper.saveStaff(staff)<1) {
            throw new MyException("插入员工部门职位关系失败");
        }
    }

    @Override
    public void update(Staff staff) {
        //获取当前时间
        //user.setUpdateTime(DateUtils.today());
        staff.setUpdateTime(new Date());
        if(userMapper.updateByPrimaryKeySelective(staff)<1){
            throw new MyException("修改用户信息失败");
        }
    }

    //级联删除
    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void delete(String userId) {
        //删除用户信息，成功之后继续删除用户对应的角色信息
        if(userMapper.deleteByPrimaryKey(userId)<1){
            Log.error("删除用户信息失败");
        }
        //根据userId查询用户所拥有的角色信息
        List<UserRole> list=userRoleMapper.selectRoleByUserId(userId);
        if(list!=null&&list.size()>0){
            if(userRoleMapper.deleteByUserId(userId)<1){
               Log.error("删除用户关联角色信息失败");
            }
        }
    }

    //获取所有用户信息
    @Override
    public List<User> getAllUsers() {
        return userMapper.getAllUsers();
    }

    @Override
    public User getUserByName(String username) {
        return userMapper.getUserByName(username);
    }

    @Override
    public Integer getCountByUserName(String userName) {
        return userMapper.getCountByUserName(userName);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void batchDelete(List<String> list) {
        //先删除关联表中的信息
        for (String userId: list){
            List<UserRole> userRoleList=userRoleMapper.selectRoleByUserId(userId);
            if(userRoleList!=null&&userRoleList.size()>0){
                if (userRoleMapper.deleteByUserId(userId)<1){
                    Log.error("删除用户角色关联信息失败");
                }
            }
        }
        //批量删除用户表中的信息
        if (userMapper.batchDelete(list)<1){
            Log.error("批量删除用户信息失败");
        }
    }

    @Override
    public Page<Staff> getMessageByCondition(RowBounds rowBounds, UserFilter filter) {
        return userMapper.getMessageByCondition(rowBounds,filter);
    }

    @Override
    public Integer getCountByFilter(Integer filter) {
        String startTime = null;
        Integer count;
        if (filter == null){
            count=userMapper.getCountByFilter(startTime);
        }else {
            startTime=DateUtils.getDateTime(filter);
            count=userMapper.getCountByFilter(startTime);
        }
        return count;
    }

    @Override
    public User getUserByUserId(String userId) {
        return userMapper.getUserByUserId(userId);
    }

    @Override
    public void cascadeUpdate(Staff staff) {
        staff.setUpdateTime(new Date());
        //级联更新数据库信息
        userMapper.cascadeUpdate(staff);
    }


}
