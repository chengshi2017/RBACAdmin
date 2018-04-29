package com.spring.service.permission;

import com.github.pagehelper.Page;
import com.spring.model.permission.Menu;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

/**
 * @Author 施成
 * @Date 2018/2/21
 * @time 21:48
 * @Describe:
 */
public interface MenuService {

    Page<Menu> getAllMenusPage(RowBounds rowBounds);

    List<Menu> getAllFirstMenus();

    Menu getMenuByMenuId(String menuId);

    void save(Menu menu);

    void update(Menu menu);

    List<Menu> getFirstLevelMenusByUserId(String userId);

    List<Menu> getMenusByParentId(String menuId);

    //根据用户id获取用户权限
    List<String> getPermissionByUserId(String userId);

    //删除菜单信息
    void delete(String menuId);
}
