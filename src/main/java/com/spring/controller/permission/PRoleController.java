package com.spring.controller.permission;

import com.github.pagehelper.Page;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.permission.Role;
import com.spring.model.permission.RoleMenu;
import com.spring.model.permission.UserRole;
import com.spring.param.RoleFilter;
import com.spring.service.permission.RoleMenuService;
import com.spring.service.permission.RoleService;
import com.spring.service.permission.UserRoleService;
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
 * @time 19:48
 * @Describe: 角色管理控制层
 */
@Controller
@RequestMapping(value = "/permission/role")
public class PRoleController extends SuperController {

    private static final Logger Log= LoggerFactory.getLogger(PRoleController.class);

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private RoleMenuService roleMenuService;

    //加载page页面
    @RequiresPermissions(value = "permission:role:page.html")
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    public String page(@RequestParam(defaultValue = "1")Integer pageNo,
                       @RequestParam(defaultValue = "10")Integer pageSize,
                       Model model){
        Page<Role> lists=roleService.getAllRoleMessage(new RowBounds((pageNo-1)*pageSize,pageSize));
        model.addAttribute("lists",lists);
        return "permission/role/roleList";
    }

    //加载角色信息编辑页面
    @RequestMapping(value = "/toUpdate",method = RequestMethod.GET)
    public String toAdd(){
        return "permission/role/role-add";
    }

    //加载角色信息修改页面
    @RequestMapping(value = "{roleId}/toUpdate",method = RequestMethod.GET)
    public String toUpdate(@PathVariable("roleId") String roleId, Model model){
        Role role=roleService.getRoleById(roleId);
        model.addAttribute("role",role);
        return "permission/role/role-add";
    }

    //数据的操作
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public void update(Role role){

        if(role.getRoleId()==null){
            //新增操作
            roleService.save(role);
            ResponseUtils.writeSuccessReponse(request,response,"角色信息添加成功");
        }else {
            //修改操作
            roleService.update(role);
            ResponseUtils.writeSuccessReponse(request,response,"角色信息修改成功");
        }
    }

    //删除角色信息
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public void delete(String roleId){
        roleService.delete(roleId);
        ResponseUtils.writeSuccessReponse(request,response,"删除角色信息成功");
    }

    //批量删除角色信息
    @PostMapping(value = "/batchDelete")
    public void batchDelete(String checkedId){
        String[] id=checkedId.split(",");
        List<String> list=Arrays.asList(id);
        roleService.batchDelete(list);
        ResponseUtils.writeSuccessReponse(request,response,"批量删除角色信息成功");
    }

    @PostMapping(value = "/retrieve")
    public String retrieve(RoleFilter filter, Model model){
        Integer pageNo=filter.getPageNo();
        Integer pageSize=filter.getPageSize();
        Page<Role> lists=roleService.getMessageByCondition(new RowBounds((pageNo-1)*pageSize,pageSize),filter);
        model.addAttribute("lists",lists);
        return "permission/role/roleList";
    }

    @PostMapping(value = "/start")
    public void start(String roleId){
        Role role=roleService.getRoleById(roleId);
        role.setStatus(role.getStatus()^1);
        roleService.update(role);
        ResponseUtils.writeSuccessReponse(request,response,"成功啦！");
    }



}
