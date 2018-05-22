package com.spring.dao;

import com.spring.model.permission.UserRole;

import java.util.List;

public interface UserRoleMapper {
    int deleteByPrimaryKey(String userRoleId);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(Integer userRoleId);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);

    List<UserRole> selectRoleByUserId(String userId);

    int deleteByUserId(String userId);

    List<UserRole> getUserRoleByUserRole(UserRole userRole);

    List<UserRole> getUserRoleByRoleId(String roleId);

    int deleteByRoleId(String roleId);
}