package com.spring.service.permission.impl;

import com.github.pagehelper.Page;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.DateUtils;
import com.spring.common.utils.UUID;
import com.spring.dao.RoleMapper;
import com.spring.dao.RoleMenuMapper;
import com.spring.dao.UserRoleMapper;
import com.spring.model.permission.Role;
import com.spring.model.permission.RoleMenu;
import com.spring.model.permission.UserRole;
import com.spring.param.RoleFilter;
import com.spring.service.permission.RoleService;
import groovy.util.IFileNameFinder;
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
 * @Date 2018/2/21
 * @time 20:23
 * @Describe:
 */
@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    private static final Logger LOGGER= LoggerFactory.getLogger(RoleServiceImpl.class);

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private RoleMenuMapper roleMenuMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public Page<Role> getAllRoleMessage(RowBounds rowBounds) {
        return roleMapper.getAllRoleMessage(rowBounds);
    }

    @Override
    public Role getRoleById(String roleId) {
        return roleMapper.selectByPrimaryKey(roleId);
    }

    @Override
    public void save(Role role) {
        role.setRoleId(UUID.getUUID());
        role.setCreateTime(DateUtils.today());
        if (roleMapper.insert(role)<1){
            throw new MyException("新增角色信息失败");
        }
    }

    @Override
    public void update(Role role) {
        role.setUpdateTime(DateUtils.today());
        if(roleMapper.updateByPrimaryKeySelective(role)<1){
            throw new MyException("修改角色信息失败");
        }
    }

    //级联删除
    @Override
    public void delete(String roleId) {
        //级联删除角色绑定的菜单信息
        List<RoleMenu> list=roleMenuMapper.getMenusByRoleId(roleId);
        if(list!=null&&list.size()>0){
            if(roleMenuMapper.deleteRoleMenusByRoleId(roleId)<1){
                throw new MyException("删除角色菜单关联关系失败");
            }
        }
        //级联删除用户角色信息
        List<UserRole> list1= userRoleMapper.getUserRoleByRoleId(roleId);
        if (list1!=null&&list1.size()>0){
            if (userRoleMapper.deleteByRoleId(roleId)<1){
                throw new MyException("删除用户角色信息失败");
            }
        }
        //删除角色信息
        if (roleMapper.deleteByPrimaryKey(roleId)<1){
            throw new MyException("删除角色信息失败！");
        }

    }

    @Override
    public void batchDelete(List<String> list) {
        //先删除关联表中的信息
        for (String roleId: list){
            List<RoleMenu> list1=roleMenuMapper.getMenusByRoleId(roleId);
            if (list1!=null&&list1.size()>0){
                if (roleMenuMapper.batchDeleteByRoleId(roleId)<1){
                    throw new MyException("删除角色菜单信息失败");
                }
            }
            List<UserRole> list2=userRoleMapper.getUserRoleByRoleId(roleId);
            if (list2!=null&&list2.size()>0){
                if (userRoleMapper.deleteByRoleId(roleId)<1){
                    throw new MyException("删除用户角色信息失败");
                }
            }
        }
        //删除角色表中的信息
        if (roleMapper.batchDelete(list)<1){
            throw new MyException("删除角色信息失败");
        }
    }

    @Override
    public Page<Role> getMessageByCondition(RowBounds rowBounds, RoleFilter filter) {
        return roleMapper.getMessageByCondition(rowBounds,filter);
    }
}
