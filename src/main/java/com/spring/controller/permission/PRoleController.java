package com.spring.controller.permission;

import com.github.pagehelper.Page;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.permission.Role;
import com.spring.service.permission.RoleService;
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
    private RoleService roleService;

    //加载page页面
    @RequiresPermissions(value = "permission:role:page")
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    public String page(){
        return "permission/role/page";
    }

    //加载角色date数据
    @RequestMapping(value = "/data",method = RequestMethod.POST)
    public String date(Integer pageNo, @RequestParam(defaultValue = "10") Integer pageSize, Model model){
        Page<Role> lists=roleService.getAllRoleMessage(new RowBounds((pageNo-1)*pageSize,pageSize));
        model.addAttribute("lists",lists);
        return "permission/role/data";
    }

    //加载角色信息编辑页面
    @RequestMapping(value = "/toUpdate",method = RequestMethod.GET)
    public String toAdd(){
        return "permission/role/update";
    }

    //加载角色信息修改页面
    @RequestMapping(value = "{roleId}/toUpdate",method = RequestMethod.GET)
    public String toUpdate(@PathVariable("roleId") String roleId, Model model){
        Role role=roleService.getRoleById(roleId);
        model.addAttribute("role",role);
        return "permission/role/update";
    }

    //数据的操作
    @RequestMapping(value = "update",method = RequestMethod.POST)
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
    @RequestMapping(value = "{roleId}/delete",method = RequestMethod.POST)
    public void delete(@PathVariable("roleId") String roleId){
        roleService.delete(roleId);
        ResponseUtils.writeSuccessReponse(request,response,"删除角色信息成功");
    }



}
