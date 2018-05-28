package com.spring.dao;

import com.spring.model.permission.RoleMenu;

import java.util.List;

public interface RoleMenuMapper {
    int deleteByPrimaryKey(String roleMenuId);

    int insert(RoleMenu record);

    int insertSelective(RoleMenu record);

    RoleMenu selectByPrimaryKey(String roleMenuId);

    int updateByPrimaryKeySelective(RoleMenu record);

    int updateByPrimaryKey(RoleMenu record);

    List<RoleMenu> getRoleMenuByRoleMenu(RoleMenu roleMenu);

    List<RoleMenu> getMenusByRoleId(String roleId);

    int deleteRoleMenusByRoleId(String roleId);

    int batchDelete(List<String> list);

    int batchDeleteByRoleId(String roleId);

    List<RoleMenu> getRoleMenuByMenuId(String menuId);

    List<RoleMenu> getRoleMenuByRoleId(String roleId);
}