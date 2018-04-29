package com.spring.service.permission.impl;

import com.spring.common.exceptions.MyException;
import com.spring.dao.UserRoleMapper;
import com.spring.model.permission.UserRole;
import com.spring.service.permission.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author Sunny
 * @Date 2018/2/23
 * @time 1:56
 * @Describe:
 */
@Service
@Transactional
public class UserRoleServiceImpl implements UserRoleService{

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public void save(UserRole userRole) {
        if(userRoleMapper.insert(userRole)<1){
            throw new MyException("新增用户角色信息失败");
        }
    }

    @Override
    public void remove(UserRole userRole) {
        //根据userId和roleId来获取UserRole信息
        List<UserRole> list=userRoleMapper.getUserRoleByUserRole(userRole);
        if(list!=null&&list.size()>0){
            for (UserRole info:list){
                if(userRoleMapper.deleteByPrimaryKey(info.getUserRoleId())<1){
                    throw new MyException("删除用户角色信息失败");
                }
            }
        }else {
            throw new MyException("该用户角色信息不存在");
        }
    }
}
