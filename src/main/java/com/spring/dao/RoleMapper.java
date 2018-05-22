package com.spring.dao;

import com.github.pagehelper.Page;
import com.spring.model.permission.Role;
import com.spring.param.RoleFilter;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(String roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(String roleId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    Page<Role> getAllRoleMessage(RowBounds rowBounds);

    List<Role> getAllRolesByUserId(String userId);

    List<Role> getAllRoles();

    int batchDelete(List<String> list);

    Page<Role> getMessageByCondition(RowBounds rowBounds, RoleFilter filter);
}