package com.spring.controller.permission;

import com.github.pagehelper.Page;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.permission.Menu;
import com.spring.service.permission.MenuService;
import org.apache.ibatis.session.RowBounds;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

    //加载page页面
    @RequiresPermissions(value = "permission:menu:page")
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    public String page(){
        return "permission/menu/page";
    }

    //加载page页面中的date数据
    @RequestMapping(value = "/data",method = RequestMethod.POST)
    public String date(Integer pageNo, @RequestParam(defaultValue = "10")Integer pageSize, Model model){
        Page<Menu> lists=menuService.getAllMenusPage(new RowBounds((pageNo-1)*pageSize,pageSize));
        model.addAttribute("lists",lists);
        return "permission/menu/data";
    }

    //加载菜单编辑页面
    @RequestMapping(value = "toUpdate",method = RequestMethod.GET)
    public String toAdd(Model model){
        List<Menu> lists=menuService.getAllFirstMenus();
        model.addAttribute("menus",lists);
        return "permission/menu/update";
    }

    //加载菜单修改页面
    @RequestMapping(value = "{menuId}/toUpdate",method = RequestMethod.GET)
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
        return "permission/menu/update";
    }

    //对菜单信息数据更改
    @RequestMapping(value = "update",method = RequestMethod.POST)
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

    @RequestMapping(value = "{menuId}/delete",method = RequestMethod.POST)
    public void delete(@PathVariable("menuId") String menuId){
        menuService.delete(menuId);
        ResponseUtils.writeSuccessReponse(request,response,"删除菜单信息成功");
    }

}
