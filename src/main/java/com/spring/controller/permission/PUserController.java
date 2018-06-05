package com.spring.controller.permission;

import com.github.pagehelper.Page;
import com.spring.common.Enums.SysTagEnums;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.Constants;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.Job;
import com.spring.model.Staff;
import com.spring.model.permission.User;
import com.spring.param.UserFilter;
import com.spring.service.emp.EmpParamService;
import com.spring.service.job.JobService;
import com.spring.service.permission.UserService;
import jdk.nashorn.internal.runtime.regexp.JoniRegExp;
import org.apache.ibatis.session.RowBounds;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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

    @Autowired
    private JobService jobService;

    @Autowired
    private EmpParamService empParamService;
    
    //加载用户权限相关页面
    @RequiresPermissions(value = "permission:user:page")
    @RequestMapping(value = "/page")
    public String page(@RequestParam(defaultValue = "1")Integer pageNo, @RequestParam(defaultValue = "10")Integer pageSize, UserFilter filter, Model model){
        Page<Staff> lists=userService.getAllUserMessage(new RowBounds((pageNo-1)*pageSize,pageSize),filter);
        model.addAttribute("lists",lists);
        return "permission/user/userList";
    }

    //加载用户编辑信息页面
    @RequestMapping(value = "/toUpdate",method = RequestMethod.GET,produces="text/html;charset=UTF-8")
    public String toAdd(Model model){
        List<Job> list=jobService.getAllJobByDeptId(Constants.DEPT_HR_ID);
        List<Job> jobList=convertList(list);
        model.addAttribute("jobList",jobList);
        return "permission/user/user-add";
    }

    //加载用户信息修改页面
    @RequestMapping(value = "{userId}/toUpdate",method = RequestMethod.GET)
    public String toUpdate(@PathVariable("userId") String userId, Model model){
        Staff staff=userService.getUserMessageById(userId);
        List<Job> list =jobService.getAllJobByDeptId(Constants.DEPT_HR_ID);
        List<Job> jobList=convertList(list);
        model.addAttribute("jobList", jobList);
        model.addAttribute("staff",staff);
        return "permission/user/user-add";
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST,produces="text/html;charset=UTF-8")
    public void update(Staff staff){
        Integer count=userService.getCountByUserName(staff.getUserName());
        if(staff.getUserId()==null){
            //新增操作
            if(count==0){
                userService.insert(staff);
                ResponseUtils.writeSuccessReponse(request,response,"用户信息添加成功");
            }else {
                ResponseUtils.writeErrorResponse(request,response,"用户名重复，请重新输入");
            }
        }
        else {
            //修改操作
            if (count<=1){
                if (staff.getUserId().equals(SysTagEnums.USERID.getValue())){
                    ResponseUtils.writeErrorResponse(request,response,"无法修改系统管理员信息");
                }else {
                    userService.cascadeUpdate(staff);
                    ResponseUtils.writeSuccessReponse(request,response,"修改用户信息成功");
                }
            }else {
                ResponseUtils.writeErrorResponse(request,response,"用户名重复，请重新输入");
            }

        }

    }

    //删除用户信息
    @RequestMapping(value = "/{userId}/delete",method = RequestMethod.POST)
    public void delete(@PathVariable("userId") String userId){
        if (userId.equals(SysTagEnums.USERID.getValue())){
            ResponseUtils.writeErrorResponse(request,response,"无法删除系统管理员信息");
        }else {
            userService.delete(userId);
            ResponseUtils.writeSuccessReponse(request,response,"删除用户信息成功");
        }
    }

    //批量删除所选用户
    @PostMapping(value = "/batchDelete")
    public void batchDelete(String checkedId){
        String[] record=checkedId.split(",");
        List<String> list=Arrays.asList(record);
        for (String userId: list){
            if (userId.equals(SysTagEnums.USERID.getValue())){
                ResponseUtils.writeErrorResponse(request,response,"所选信息包括系统管理员信息，无法删除，请重选");
                throw new MyException("系统管理员信息无法删除");
            }
        }
        userService.batchDelete(list);
        ResponseUtils.writeSuccessReponse(request,response,"批量删除用户信息成功");
    }

    @PostMapping(value = "/{userId}/update")
    public void update(@PathVariable("userId")String userId){
        Staff staff=userService.getUserMessageById(userId);
        if (staff.getUserId().equals(SysTagEnums.USERID.getValue())){
            ResponseUtils.writeErrorResponse(request,response,"系统管理员无法禁用");
        }else {
            staff.setuStatus(staff.getuStatus()^1);
            userService.cascadeUpdate(staff);
            ResponseUtils.writeSuccessReponse(request,response,"成功啦！");
        }
    }

    @PostMapping(value = "/retrieve")
    public String getMessages(UserFilter filter,Model model){
        int pageNo=filter.getPageNo();
        int pageSize=filter.getPageSize();
        Page<Staff> lists=userService.getMessageByCondition(new RowBounds((pageNo-1)*pageSize,pageSize),filter);
        model.addAttribute("lists",lists);
        return "permission/user/userList";

    }

    private List<Job> convertList(List<Job> list) {
        List<Job> jobList=new ArrayList<>();
        for (Job job:list){
            Integer count=empParamService.getCountByJobId(job.getJobId());
            if (count<job.getVolume()){
                jobList.add(job);
            }
        }
        return jobList;
    }

}
