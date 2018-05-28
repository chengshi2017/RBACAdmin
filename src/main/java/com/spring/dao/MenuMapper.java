package com.spring.dao;

import com.github.pagehelper.Page;
import com.spring.model.permission.Menu;
import com.spring.param.MenuFilter;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface MenuMapper {
    int deleteByPrimaryKey(String menuId);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(String menuId);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    Page<Menu> getAllMenusPage(RowBounds rowBounds);

    List<Menu> getAllFirstMenus();

    Menu getMenusById(String parentId);

    List<Menu> getAllMenus();

    List<Menu> getAllMenusByRoleId(String roleId);

    List<Menu> getFirstLevelMenusByUserId(String userId);

    List<Menu> getMenusByParentId(String menuId);

    //根据用户id查询用户所有菜单
    List<Menu> getAllMenusByUserId(String userId);

    int batchDelete(List<String> checkList);

    Page<Menu> getMessageByCondition(RowBounds rowBounds, MenuFilter filter);

    List<Menu> getSecondLevelMenusByUserId(String userId);
}