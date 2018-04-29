package com.spring.service.permission.impl;

import com.github.pagehelper.Page;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.DateUtils;
import com.spring.common.utils.UUID;
import com.spring.dao.RoleMapper;
import com.spring.dao.RoleMenuMapper;
import com.spring.model.permission.Role;
import com.spring.model.permission.RoleMenu;
import com.spring.service.permission.RoleService;
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
        if(roleMapper.updateByPrimaryKey(role)<1){
            throw new MyException("修改角色信息失败");
        }
    }

    //级联删除
    @Override
    public void delete(String roleId) {
        //先删除角色信息
        if (roleMapper.deleteByPrimaryKey(roleId)<1){
            LOGGER.info("删除角色信息失败！");
        }
        //级联删除角色绑定的菜单信息
        List<RoleMenu> list=roleMenuMapper.getMenusByRoleId(roleId);
        if(list!=null&&list.size()>0){
            if(roleMenuMapper.deleteRoleMenusByRoleId(roleId)<1){
                LOGGER.info("删除角色菜单关联关系失败");
            }
        }

    }
}
