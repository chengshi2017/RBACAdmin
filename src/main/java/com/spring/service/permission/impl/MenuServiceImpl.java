package com.spring.service.permission.impl;

import com.github.pagehelper.Page;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.UUID;
import com.spring.dao.MenuMapper;
import com.spring.dao.RoleMenuMapper;
import com.spring.model.permission.Menu;
import com.spring.model.permission.RoleMenu;
import com.spring.service.permission.MenuService;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @Author 施成
 * @Date 2018/2/21
 * @time 22:29
 * @Describe:
 */
@Service
@Transactional
public class MenuServiceImpl implements MenuService {

    private static final Logger Log= LoggerFactory.getLogger(MenuServiceImpl.class);

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private RoleMenuMapper roleMenuMapper;

    @Override
    public Page<Menu> getAllMenusPage(RowBounds rowBounds) {
        Page<Menu> list=menuMapper.getAllMenusPage(rowBounds);
        //获取父级菜单名称
        for (Menu menu:list){
            if(menu.getParentId()!=null&&!"".equals(menu.getParentId())){
                Menu parentMenu=menuMapper.getMenusById(menu.getParentId());
                menu.setParentName(parentMenu.getMenuName());
            }
        }
        return list;
    }

    @Override
    public List<Menu> getAllFirstMenus() {
        return menuMapper.getAllFirstMenus();
    }

    @Override
    public Menu getMenuByMenuId(String menuId) {
        return menuMapper.getMenusById(menuId);
    }

    @Override
    public void save(Menu menu) {
        menu.setMenuId(UUID.getUUID());
        if(menuMapper.insert(menu)<1){
            throw new MyException("新增菜单信息成功");
        }
    }

    @Override
    public void update(Menu menu) {
        if(menuMapper.updateByPrimaryKey(menu)<1){
            throw new MyException("修改菜单信息成功");
        }
    }

    @Override
    public List<Menu> getFirstLevelMenusByUserId(String userId) {
        return menuMapper.getFirstLevelMenusByUserId(userId);
    }

    @Override
    public List<Menu> getMenusByParentId(String menuId) {
        return menuMapper.getMenusByParentId(menuId);
    }

    //根据用户id查询用户权限
    @Override
    public List<String> getPermissionByUserId(String userId) {
        List<Menu> lists=menuMapper.getAllMenusByUserId(userId);
        List<String> permissions=new ArrayList<>();
        if (lists!=null&&lists.size()>0){
            for (Menu menu:lists){
                if(StringUtils.isNotBlank(menu.getPermission())){
                    permissions.add(menu.getPermission());
                }
            }
        }
        return permissions;
    }

    @Override
    public void delete(String menuId) {
        List<String> list=new ArrayList<>();
        List<RoleMenu> list1=roleMenuMapper.selectAllByMenuId(menuId);
        //先删除关联表中的信息
        if(list1!=null&&list1.size()>0){
              //迭代器写法
//            Iterator iterator=list.iterator();
//            while (iterator.hasNext()){
//                RoleMenu roleMenu= (RoleMenu) iterator.next();
//                list.add(roleMenu.getRoleMenuId());
//                if(roleMenuMapper.batchDelete(list)<1){
//                    throw new MyException("批量删除关联表信息失败");
//                }
//            }
            //foreach遍历写法，底层调用迭代器（推荐）
            for (RoleMenu roleMenu:list1){
                list.add(roleMenu.getRoleMenuId());
                if (roleMenuMapper.batchDelete(list)<1){
                    throw new MyException("批量删除关联表信息失败！");
                }
            }
        }
        //删除菜单
        if (menuMapper.deleteByPrimaryKey(menuId)<1){
            throw new MyException("删除菜单信息失败");
        }

    }
}
