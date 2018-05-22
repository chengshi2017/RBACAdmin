package com.spring.service.permission;

import com.github.pagehelper.Page;
import com.spring.model.permission.Role;
import com.spring.param.RoleFilter;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

/**
 * @Author 施成
 * @Date 2018/2/21
 * @time 19:51
 * @Describe:
 */
public interface RoleService {

    Page<Role> getAllRoleMessage(RowBounds rowBounds);

    Role getRoleById(String roleId);

    void save(Role role);

    void update(Role role);

    void delete(String roleId);

    void batchDelete(List<String> list);

    Page<Role> getMessageByCondition(RowBounds rowBounds, RoleFilter filter);
}
