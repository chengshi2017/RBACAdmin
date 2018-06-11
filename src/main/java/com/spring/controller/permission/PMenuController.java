package com.spring.controller.permission;

import com.github.pagehelper.Page;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.permission.Menu;
import com.spring.model.permission.RoleMenu;
import com.spring.param.MenuFilter;
import com.spring.service.permission.MenuService;
import com.spring.service.permission.RoleMenuService;
import org.apache.ibatis.session.RowBounds;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * @Author 施成
 * @Date 2018/2/21
 * @time 21:46
 * @Describe: 菜单管理控制层
 */
@Controller
@RequestMapping(value = "/permission/menu")
public class PMenuController extends SuperController {

    private static final Logger Log= LoggerFactory.getLogger(PMenuController.class);

    @Autowired
    private MenuService menuService;

    @Autowired
    private RoleMenuService roleMenuService;

    //加载page页面
    @RequiresPermissions(value = "permission:menu:page")
    @RequestMapping(value = "/page")
    public String page(@RequestParam(defaultValue = "1")Integer pageNo,
                       @RequestParam(defaultValue = "10")Integer pageSize,
                       Model model){
        //获取所有的菜单名称
        List<Menu> menuList=menuService.getAllMenus();
        model.addAttribute("menuNameList",menuList);
        //获取菜单数据
        Page<Menu> lists=menuService.getAllMenusPage(new RowBounds((pageNo-1)*pageSize,pageSize));
        model.addAttribute("lists",lists);
        return "permission/menu/menuList";
    }

    //加载菜单编辑页面
    @RequestMapping(value = "/toUpdate",method = RequestMethod.GET)
    public String toAdd(Model model){
        List<Menu> lists=menuService.getAllFirstMenus();
        model.addAttribute("menus",lists);
        return "permission/menu/menu-add";
    }

    //加载菜单修改页面
    @RequestMapping(value = "/{menuId}/toUpdate",method = RequestMethod.GET)
    public String toUpdate(@PathVariable("menuId")String menuId, Model model){
        Menu menu=menuService.getMenuByMenuId(menuId);
        if(menu.getParentId()!=null&&!"".equals(menu.getParentId())){
            Menu parentMenu=menuService.getMenuByMenuId(menu.getParentId());
            menu.setParentName(parentMenu.getMenuName());
        }
        //加载所有有效菜单
        List<Menu> list=menuService.getAllFirstMenus();
        model.addAttribute("menus",list);
        model.addAttribute("menu",menu);
        return "permission/menu/menu-add";
    }

    //对菜单信息数据更改
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public void update(Menu menu){
        if(menu.getMenuId()==null){
            //新增操作
            menuService.save(menu);
            ResponseUtils.writeSuccessReponse(request,response,"新增菜单信息成功");
        }else {
            menuService.update(menu);
            ResponseUtils.writeSuccessReponse(request,response,"修改菜单信息成功");
        }
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public void delete(String menuId){
        List<RoleMenu> list=roleMenuService.getMessageByMenuId(menuId);
        if (list!=null&&list.size()>0){
            ResponseUtils.writeErrorResponse(request,response,"存在角色菜单关联信息，无法删除");
            throw new MyException("存在角色菜单关联信息，无法删除");
        }
        menuService.delete(menuId);
        ResponseUtils.writeSuccessReponse(request,response,"删除菜单信息成功");
    }

    @PostMapping(value = "/batchDelete")
    public void batchDelete(String checkedId){
        String[] record=checkedId.split(",");
        List<String> checkList=Arrays.asList(record);
        for (String menuId: checkList){
            List<RoleMenu> list=roleMenuService.getMessageByMenuId(menuId);
            if (list!=null&&list.size()>1){
                ResponseUtils.writeErrorResponse(request,response,"存在角色菜单关联信息，无法删除");
                throw new MyException("存在角色菜单关联信息，无法删除");
            }
        }
        menuService.batchDelete(checkList);
        ResponseUtils.writeSuccessReponse(request,response,"批量删除菜单信息成功");
    }

    @PostMapping(value = "/start")
    public void start(String menuId){
        Menu menu=menuService.getMenuByMenuId(menuId);
        menu.setStatus(menu.getStatus()^1);
        menuService.update(menu);
        ResponseUtils.writeSuccessReponse(request,response,"成功啦");
    }

    @PostMapping(value = "/retrieve")
    public String retrieve(MenuFilter filter,Model model){
        Integer pageNo=filter.getPageNo();
        Integer pageSize=filter.getPageSize();
        Page<Menu> lists=menuService.getMessageByCondition(new RowBounds((pageNo-1)*pageSize,pageSize),filter);
        model.addAttribute("lists",lists);
        return "permission/menu/menuList";

    }


}
