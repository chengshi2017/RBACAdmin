package com.spring.controller.permission;

import com.github.pagehelper.Page;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.permission.User;
import com.spring.service.permission.UserService;
import org.apache.ibatis.session.RowBounds;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Author 施成
 * @Date 2018/2/17
 * @time 9:51
 * @Describe:
 */
@Controller
@RequestMapping(value = "/permission/user")
public class PUserController extends SuperController {

    @Autowired
    private UserService userService;
    
    //加载用户权限相关页面
    @RequiresPermissions(value = "permission:user:page")
    @RequestMapping(value = "/page")
    public String page(Integer pageNo,@RequestParam(defaultValue = "10")Integer pageSize,Model model){
        Page<User> lists=userService.getAllUserMessage(new RowBounds((pageNo-1)*pageSize,pageSize));
        model.addAttribute("lists",lists);
        return "system/userList";
    }

//    //加载用户权限相关数据
//    @RequestMapping(value = "/data",method = RequestMethod.POST)
//    public String date(Integer pageNo, @RequestParam(defaultValue = "10")Integer pageSize, Model model){
//
//        Page<User> lists=userService.getAllUserMessage(new RowBounds((pageNo-1)*pageSize,pageSize));
//        model.addAttribute("lists",lists);
//        return "permission/user/data";
//    }

    //加载用户编辑信息页面
    @RequestMapping(value = "/toUpdate",method = RequestMethod.GET,produces="text/html;charset=UTF-8")
    public String toAdd(){
        return "permission/user/update";
    }

    //加载用户信息修改页面
    @RequestMapping(value = "{userId}/toUpdate",method = RequestMethod.GET)
    public String toUpdate(@PathVariable("userId") String userId, Model model){
        User user=userService.getUserMessageById(userId);
        model.addAttribute("user",user);
        return "permission/user/update";
    }

    @RequestMapping(value = "update",method = RequestMethod.POST,produces="text/html;charset=UTF-8")
    public void update(User user){
        if(user.getUserId()==null){
            //新增操作
            Integer count=userService.getCountByUserName(user.getUserName());
            if(count==0){
                userService.insert(user);
                ResponseUtils.writeSuccessReponse(request,response,"用户信息添加成功");
            }else {
                ResponseUtils.writeErrorResponse(request,response,"用户名重复，请重新输入");
            }
        }
        else {
            //修改操作
            userService.update(user);
            ResponseUtils.writeSuccessReponse(request,response,"修改用户信息成功");
        }

    }

    //删除用户信息
    @RequestMapping(value = "{userId}/delete",method = RequestMethod.POST)
    public void delete(@PathVariable("userId") String userId){
        userService.delete(userId);
        ResponseUtils.writeSuccessReponse(request,response,"删除用户信息成功");
    }




}
