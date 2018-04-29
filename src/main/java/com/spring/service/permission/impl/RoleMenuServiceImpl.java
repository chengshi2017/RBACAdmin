package com.spring.service.permission.impl;

import com.spring.common.exceptions.MyException;
import com.spring.dao.RoleMenuMapper;
import com.spring.model.permission.RoleMenu;
import com.spring.service.permission.RoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author Sunny
 * @Date 2018/2/23
 * @time 12:57
 * @Describe:
 */
@Service
@Transactional
public class RoleMenuServiceImpl implements RoleMenuService {

    @Autowired
    private RoleMenuMapper roleMenuMapper;

    @Override
    public void insert(RoleMenu roleMenu) {
        if (roleMenuMapper.insertSelective(roleMenu)<1){
            throw new MyException("新增角色菜单信息失败");
        }
    }


    @Override
    public void remove(RoleMenu roleMenu) {
        //根据roleId和menuId查询roleMenu信息
        RoleMenu info=roleMenuMapper.getRoleMenuByRoleMenu(roleMenu);
        if(info!=null){
            if(roleMenuMapper.deleteByPrimaryKey(info.getRoleMenuId())<1){
                throw new MyException("删除角色菜单信息失败");
            }
        }else {
            throw new MyException("该角色菜单信息为空");
        }

    }
}
