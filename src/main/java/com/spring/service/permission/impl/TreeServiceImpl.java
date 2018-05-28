package com.spring.service.permission.impl;

import com.spring.common.Enums.SysTagEnums;
import com.spring.dao.MenuMapper;
import com.spring.dao.RoleMapper;
import com.spring.model.permission.Menu;
import com.spring.model.permission.Role;
import com.spring.model.permission.TreeInfo;
import com.spring.service.permission.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author Sunny
 * @Date 2018/2/22
 * @time 22:57
 * @Describe:
 */
@Service
@Transactional
public class TreeServiceImpl implements TreeService{

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<TreeInfo> getRoleTree(String userId) {
        List<TreeInfo> list=new ArrayList<>();
        //获得有效的角色信息
        List<Role> allVaildRoles=roleMapper.getAllRoles();
        //获得该用户对应的角色信息
        List<Role> uRoles=roleMapper.getAllRolesByUserId(userId);
        for(Role role:allVaildRoles){
            //创建tree
            TreeInfo tree=new TreeInfo();
            tree.setId(role.getRoleId());
            tree.setName(role.getRoleName());
            tree.setRole(true);

            for (Role item:uRoles){
                if(role.getRoleId().equals(item.getRoleId())){
                    tree.setChecked(true);
                }
                if (role.getRoleId().equals(SysTagEnums.ROLEID.getValue())){
                    tree.setChkDisabled(true);
                }
            }
            list.add(tree);
        }
        return list;
    }

    @Override
    public List<TreeInfo> getMenuTree(String roleId, boolean checked) {
        List<TreeInfo> list=new ArrayList<>();
        //根据roleId查询该角色对应的所有菜单信息
        List<Menu> allMenus=menuMapper.getAllMenusByRoleId(roleId);
        //查询所有的菜单信息
        List<Menu> allVaildMenus=menuMapper.getAllMenus();
        for (Menu menu:allVaildMenus){
            TreeInfo tree=new TreeInfo();
            tree.setId(menu.getMenuId());
            tree.setPid(menu.getParentId());
            tree.setName(menu.getMenuName());
            //遍历该角色已经拥有的菜单
            for (Menu item:allMenus){
                if(menu.getMenuId().equals(item.getMenuId())){
                    tree.setChecked(true);
                }
                if (roleId.equals(SysTagEnums.ROLEID.getValue())){
                    tree.setChkDisabled(true);

                }
            }
            list.add(tree);
        }
        return list;


    }
}
