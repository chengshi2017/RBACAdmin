package com.spring.controller.emp;

import com.github.pagehelper.Page;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.Dept;
import com.spring.model.Emp;
import com.spring.model.Job;
import com.spring.param.EmpFilter;
import com.spring.service.dept.DeptService;
import com.spring.service.emp.EmpService;
import com.spring.service.job.JobService;
import org.apache.ibatis.session.RowBounds;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.logging.Filter;

/**
 * @Author Sunny
 * @Date 2018/3/1
 * @time 10:22
 * @Describe:
 */
@Controller
@RequestMapping(value = "/emp")
public class EmpController extends SuperController {

    @Autowired
    private EmpService empService;

    @Autowired
    private DeptService deptService;

    @Autowired
    private JobService jobService;

    @RequiresPermissions(value = "emp:page")
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    public String toPage(@RequestParam(defaultValue = "1")Integer pageNo,
                         @RequestParam(defaultValue = "10")Integer pageSize,
                         Model model){
        List<Dept> deptList=deptService.getAllDept();
        model.addAttribute("deptList",deptList);
        List<Job> jobList=jobService.getAllJob();
        model.addAttribute("jobList",jobList);
        Page<Emp> lists=empService.getAllEmp(new RowBounds((pageNo-1)*pageSize,pageSize));
        model.addAttribute("lists",lists);
        return "emp/empList";
    }

    //加载员工新增页面
    @RequestMapping(value = "/toUpdate",method = RequestMethod.GET)
    public String toAdd(Model model){
        List<Dept> deptList=deptService.getAllDept();
        List<Job> jobList=jobService.getAllJob();
        model.addAttribute("deptList",deptList);
        model.addAttribute("jobList",jobList);
        return "emp/emp_add";
    }

    //加载员工信息修改页面
    @RequestMapping(value = "/{empId}/toUpdate",method = RequestMethod.GET)
    public String toUpdate(@PathVariable("empId")String empId, Model model){
        Emp emp=empService.getEmpByEmpId(empId);
        List<Dept> deptList=deptService.getAllDept();
        List<Job> jobList=jobService.getAllJob();
        model.addAttribute("emp",emp);
        model.addAttribute("deptList",deptList);
        model.addAttribute("jobList",jobList);
        return "emp/emp_add";
    }

    //对员工信息数据进行修改
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public void update(Emp emp){
        //新增操作
        if(emp.getEmpId()==null){
            empService.insert(emp);
            ResponseUtils.writeSuccessReponse(request,response,"新增员工信息成功");
        }
        //修改操作
        else{
            empService.update(emp);
            ResponseUtils.writeSuccessReponse(request,response,"修改员工信息成功");
        }

    }

    //对员工信息进行删除
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public void delete(String empId){
        empService.delete(empId);
        ResponseUtils.writeSuccessReponse(request,response,"删除员工信息成功");
    }

    //批量删除员工信息
    @PostMapping(value = "/batchDelete")
    public void batchDelete(String empId){
        String[] empArrays=empId.split(",");
        List<String> list=Arrays.asList(empArrays);
        empService.batchDelete(list);
        ResponseUtils.writeSuccessReponse(request,response,"批量删除员工信息成功");

    }

    @PostMapping(value = "/retrieve")
    public String retrieve(EmpFilter filter,Model model){
        Integer pageNo=filter.getPageNo();
        Integer pageSize=filter.getPageSize();
        Page<Emp> lists=empService.getMessageByCondition(new RowBounds((pageNo-1)*pageSize,pageSize),filter);
        model.addAttribute("lists",lists);
        return "emp/empList";
    }

    @PostMapping(value = "/start")
    public void start(String empId){
        Emp emp=empService.getEmpByEmpId(empId);
        emp.setStatus(emp.getStatus()^1);
        empService.update(emp);
        ResponseUtils.writeSuccessReponse(request,response,"成功啦！");
    }

    @RequestMapping(value = "/{empId}/check")
    public String check(@PathVariable(value = "empId")String empId,Model model){
        Emp emp=empService.getEmpByEmpId(empId);
        model.addAttribute("emp",emp);
        return "emp/emp_show";
    }


}
