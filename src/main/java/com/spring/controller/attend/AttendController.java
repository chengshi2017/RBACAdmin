package com.spring.controller.attend;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.Staff;
import com.spring.model.attend.Attend;
import com.spring.model.permission.User;
import com.spring.service.attend.AttendService;
import com.spring.service.permission.UserService;
import org.apache.ibatis.session.RowBounds;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author: Jeremy
 * @Date: 2018/6/6
 * @Time: 16:13
 * @Version: 1.0
 * @Describe:
 */
@Controller
@RequestMapping(value = "/attend")
public class AttendController extends SuperController{

    @Autowired
    private AttendService attendService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/signPage")
    public String signPage(Model model){
        User user=getUser();
        Staff staff=userService.getUserMessageById(user.getUserId());
        model.addAttribute("staff",staff);
        return "attend/page";
    }

    @RequestMapping(value = "/sign",method = RequestMethod.POST)
    public void attend(Model model){
        //从session中获取当前用户
        User user=getUser();
        //执行打卡过程
        attendService.sign(user);
        ResponseUtils.writeSuccessReponse(request,response,"打卡成功");
    }

    @RequestMapping(value = "/page")
    @RequiresPermissions(value = "attend:page")
    public String toPage(Model model){
        return "/attend/attendList";
    }


    //分页查询当前用户打卡信息
    @RequestMapping(value = "/data")
    public void getAllAttendRecord(@RequestParam(defaultValue = "month")String id){
        User user=getUser();
        List<Attend> lists=attendService.getAllAttendRecord(user.getUserId(),id);
        ResponseUtils.writeSuccessReponse(request,response,lists);
    }
}
