package com.spring.controller.permission;

import com.alibaba.fastjson.JSON;
import com.spring.common.Enums.StatusEnums;
import com.spring.common.utils.ResponseUtils;
import com.spring.common.utils.UUID;
import com.spring.controller.base.SuperController;
import com.spring.model.permission.RoleMenu;
import com.spring.model.permission.TreeInfo;
import com.spring.model.permission.User;
import com.spring.model.permission.UserRole;
import com.spring.service.permission.RoleMenuService;
import com.spring.service.permission.TreeService;
import com.spring.service.permission.UserRoleService;
import com.spring.service.permission.UserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @Author Sunny
 * @Date 2018/2/22
 * @time 1:02
 * @Describe: 授权管理控制层
 */
@Controller
@RequestMapping(value = "/permission/grant")
public class PGrantController extends SuperController {

    private static final Logger Log= LoggerFactory.getLogger(PGrantController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private TreeService treeService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private RoleMenuService roleMenuService;

    //加载page页面
    @RequiresPermissions(value = "permission:grant:page")
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    public String toPage(Model model){
        List<User> lists=userService.getAllUsers();
        model.addAttribute("lists",lists);
        return "permission/grant/grant";
    }

    //加载角色信息
    @RequestMapping(value = "showResources",method = RequestMethod.POST)
    public void showResources(String userId){
        List<TreeInfo> list=treeService.getRoleTree(userId);
        String json=JSON.toJSONString(list);
        ResponseUtils.writeSuccessReponse(request,response,json);
    }

    //加载资源信息
    @RequestMapping(value = "/loadResources",method = RequestMethod.POST)
    public void loadResources(String roleId,boolean checked){
        List<TreeInfo> list=treeService.getMenuTree(roleId,checked);
        String json=JSON.toJSONString(list);
        ResponseUtils.writeSuccessReponse(request,response,json);
    }

    //修改用户角色信息
    @RequestMapping(value = "/updateUserRole",method = RequestMethod.POST)
    public void updateUserRole(String userId,String roleId,boolean checked){
        //checked为true时表示新增
        UserRole userRole=new UserRole();
        userRole.setUserId(userId);
        userRole.setRoleId(roleId);
        if(checked){
            userRole.setUserRoleId(UUID.getUUID());
            userRole.setStatus(StatusEnums.VALID.getValue());
            userRoleService.save(userRole);
            ResponseUtils.writeSuccessReponse(request,response,"新增用户角色信息成功");
        }else {
            userRoleService.remove(userRole);
            ResponseUtils.writeSuccessReponse(request,response,"删除用户角色信息成功");
        }

    }

    //修改角色菜单信息
    @RequestMapping(value = "updateRoleMenu",method = RequestMethod.POST)
    public void updateRoleMenu(String roleId,String menuId,boolean checked){
        //checked 为true时表示新增
        RoleMenu roleMenu=new RoleMenu();
        roleMenu.setRoleId(roleId);
        roleMenu.setMenuId(menuId);
        if(checked){
            roleMenu.setRoleMenuId(UUID.getUUID());
            roleMenu.setStatus(StatusEnums.VALID.getValue());
            roleMenuService.insert(roleMenu);
            ResponseUtils.writeSuccessReponse(request,response,"新增角色菜单信息成功");
        }else {
            roleMenuService.remove(roleMenu);
            ResponseUtils.writeSuccessReponse(request,response,"删除角色菜单信息成功");
        }


    }

}
