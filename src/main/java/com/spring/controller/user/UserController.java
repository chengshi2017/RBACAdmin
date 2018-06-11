package com.spring.controller.user;

import com.spring.common.utils.EncodeMD5;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.Staff;
import com.spring.model.permission.User;
import com.spring.service.permission.UserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Author Sunny
 * @Date 2018/2/23
 * @time 13:26
 * @Describe:
 */
@Controller
@RequestMapping(value = "/user")
public class UserController extends SuperController {

    @Autowired
    private UserService userService;

    //加载page页面
    @RequiresPermissions(value = "user:page")
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    public String toPage(Model model){
        User user=getUser();
        if(user!=null){
            Staff staff=userService.getUserMessageById(user.getUserId());
            model.addAttribute("staff",staff);
        }
        return "persion/information";
    }

    //修改用户密码
    @RequestMapping(value = "updatePassword",method = RequestMethod.POST)
    public void updatePassword(String oldPassword,String userId,Staff info){

        Staff staff=userService.getUserMessageById(userId);
        if(staff!=null){
            if(EncodeMD5.GetMD5Code(oldPassword).equals(staff.getUserPassword())){
                //加密密码
                info.setUserPassword(EncodeMD5.GetMD5Code(info.getUserPassword()));
                userService.cascadeUpdate(info);
                ResponseUtils.writeSuccessReponse(request,response,"用户登录密码修改成功");
            }
            ResponseUtils.writeErrorResponse(request,response,"原密码输入错误");
        }
        ResponseUtils.writeErrorResponse(request,response,"用户不存在，请刷新后重新登录");

    }

}
