package com.spring.controller.emp;

import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.Dept;
import com.spring.model.Emp;
import com.spring.model.Job;
import com.spring.service.dept.DeptService;
import com.spring.service.emp.EmpService;
import com.spring.service.job.JobService;
import org.apache.ibatis.session.RowBounds;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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
    public String toPage(){
        return "emp/page";
    }

    @RequestMapping(value = "/data", method = RequestMethod.POST)
    public String data(Integer pageNo, @RequestParam(defaultValue = "10") Integer pageSize, String empName, Model model) {
        List<Emp> lists = empService.getAllEmp(new RowBounds((pageNo - 1) * pageSize, pageSize));
        model.addAttribute("lists", lists);
        return "emp/data";
    }

    //加载员工新增页面
    @RequestMapping(value = "/toUpdate",method = RequestMethod.GET)
    public String toAdd(Model model){
        List<Dept> deptList=deptService.getAllDept();
        List<Job> jobList=jobService.getAllJob();
        model.addAttribute("deptList",deptList);
        model.addAttribute("jobList",jobList);
        return "emp/update";
    }

    //加载员工信息修改页面
    @RequestMapping(value = "{empId}/toUpdate",method = RequestMethod.GET)
    public String toUpdate(@PathVariable("empId")String empId, Model model){
        Emp emp=empService.getEmpByEmpId(empId);
        List<Dept> deptList=deptService.getAllDept();
        List<Job> jobList=jobService.getAllJob();
        model.addAttribute("emp",emp);
        model.addAttribute("deptList",deptList);
        model.addAttribute("jobList",jobList);
        return "emp/update";
    }

    //对员工信息数据进行修改
    @RequestMapping(value = "update",method = RequestMethod.POST)
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
    @RequestMapping(value = "{empId}/delete",method = RequestMethod.POST)
    public void delete(@PathVariable("empId")String empId){
        empService.delete(empId);
        ResponseUtils.writeSuccessReponse(request,response,"删除员工信息成功");
    }

    //对员工信息进行筛选
    @RequestMapping(value = "/retrieve",method = RequestMethod.POST)
    public String retrieve(String empName,Model model){
        List<Emp> lists=empService.getEmpMessageByEmpName(empName);
        model.addAttribute("lists",lists);
        return "emp/data";
    }






}
