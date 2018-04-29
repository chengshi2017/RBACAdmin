package com.spring.service.permission;

import com.spring.model.permission.TreeInfo;

import java.util.List;

/**
 * @Author Sunny
 * @Date 2018/2/22
 * @time 21:43
 * @Describe:
 */
public interface TreeService {

    List<TreeInfo> getRoleTree(String userId);

    List<TreeInfo> getMenuTree(String roleId, boolean checked);
}
