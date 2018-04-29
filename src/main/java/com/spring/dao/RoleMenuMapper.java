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

    RoleMenu getRoleMenuByRoleMenu(RoleMenu roleMenu);

    List<RoleMenu> getMenusByRoleId(String roleId);

    int deleteRoleMenusByRoleId(String roleId);

    List<RoleMenu> selectAllByMenuId(String menuId);

    int batchDelete(List<String> list);
}