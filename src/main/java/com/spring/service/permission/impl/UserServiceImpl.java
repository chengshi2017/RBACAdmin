package com.spring.service.permission.impl;

import com.github.pagehelper.Page;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.DateUtils;
import com.spring.common.utils.EncodeMD5;
import com.spring.common.utils.UUID;
import com.spring.dao.UserMapper;
import com.spring.dao.UserRoleMapper;
import com.spring.model.permission.User;
import com.spring.model.permission.UserRole;
import com.spring.param.UserFilter;
import com.spring.service.permission.UserService;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author 施成
 * @Date 2018/2/20
 * @time 1:20
 * @Describe:
 */
@Service
@Transactional
public class UserServiceImpl implements UserService{

    private static final Logger Log= LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public Page<User> getAllUserMessage(RowBounds rowBounds,UserFilter filter) {
        return userMapper.getAll(rowBounds,filter);
    }

    @Override
    public User getUserMessageById(String userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    @Override
    public void insert(User user) {
        //设置用户UUID
        user.setUserId(UUID.getUUID());
        //获取当前时间
        user.setCreateTime(DateUtils.today());
        //密码加密
        user.setUserPassword(EncodeMD5.GetMD5Code(user.getUserPassword()));

        if(userMapper.insert(user)<1){
            throw new MyException("新增用户信息失败！");
        }
    }

    @Override
    public void update(User user) {
        //获取当前时间
        user.setUpdateTime(DateUtils.today());

        if(userMapper.updateByPrimaryKeySelective(user)<1){
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
    public Page<User> getMessageByCondition(RowBounds rowBounds, UserFilter filter) {
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


}
