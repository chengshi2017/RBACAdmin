package com.spring.controller.emp;

import com.github.pagehelper.Page;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.dao.JobMapper;
import com.spring.model.Dept;
import com.spring.model.Emp;
import com.spring.model.Job;
import com.spring.model.Staff;
import com.spring.param.EmpFilter;
import com.spring.service.dept.DeptService;
import com.spring.service.emp.EmpParamService;
import com.spring.service.emp.EmpService;
import com.spring.service.job.JobService;
import org.apache.ibatis.session.RowBounds;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
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

    @Autowired
    private EmpParamService empParamService;

    @RequiresPermissions(value = "emp:page")
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    public String toPage(@RequestParam(defaultValue = "1")Integer pageNo,
                         @RequestParam(defaultValue = "10")Integer pageSize,
                         Model model){
        List<Dept> deptList=deptService.getAllDept();
        model.addAttribute("deptList",deptList);
        List<Job> jobList=jobService.getAllJob();
        model.addAttribute("jobList",jobList);
        Page<Staff> lists=empService.getAllEmp(new RowBounds((pageNo-1)*pageSize,pageSize));
        model.addAttribute("lists",lists);
        return "emp/empList";
    }

    //加载员工新增页面
    @RequestMapping(value = "/toUpdate",method = RequestMethod.GET)
    public String toAdd(Model model){
        List<Dept> deptList=deptService.getAllDept();
        model.addAttribute("deptList",deptList);
        return "emp/emp_add";
    }

    //加载员工信息修改页面
    @RequestMapping(value = "/{empId}/toUpdate",method = RequestMethod.GET)
    public String toUpdate(@PathVariable("empId")String empId, Model model){
        Staff staff=empService.getEmpByEmpId(empId);
        List<Dept> deptList=deptService.getAllDept();
        List<Job> list=jobService.getAllJobByDeptId(staff.getDeptId());
        List<Job> jobList=convertList(list);
        model.addAttribute("staff",staff);
        model.addAttribute("deptList",deptList);
        model.addAttribute("jobList",jobList);
        return "emp/emp_add";
    }

    //对员工信息数据进行修改
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public void update(Staff staff){
        List<Staff> staffList=empService.getEmpMessageByEmpName(staff.getEmpName());
        Integer count=staffList.size();
        //新增操作
        if(staff.getEmpId()==null){
            if (count==0){
                empService.insert(staff);
                ResponseUtils.writeSuccessReponse(request,response,"新增员工信息成功");
            }else {
                ResponseUtils.writeErrorResponse(request,response,"员工名重复，请使用别名或更正员工信息");
            }
        }
        //修改操作
        else{
            if (count<=1){
                empService.cascadeUpdate(staff);
                ResponseUtils.writeSuccessReponse(request,response,"修改员工信息成功");
            }else {
                ResponseUtils.writeErrorResponse(request,response,"用户名重复，无法修改");

            }
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
        for (String id:list){
            Staff staff=empService.getEmpByEmpId(id);
            if (staff.isFlag()){
                ResponseUtils.writeErrorResponse(request,response,"选中的员工包括管理员，无法删除");
                throw new MyException("选中的员工信息包括管理员，无法删除");
            }
        }
        empService.batchDelete(list);
        ResponseUtils.writeSuccessReponse(request,response,"批量删除员工信息成功");

    }

    @PostMapping(value = "/retrieve")
    public String retrieve(EmpFilter filter,Model model){
        Integer pageNo=filter.getPageNo();
        Integer pageSize=filter.getPageSize();
        Page<Staff> lists=empService.getMessageByCondition(new RowBounds((pageNo-1)*pageSize,pageSize),filter);
        model.addAttribute("lists",lists);
        return "emp/empList";
    }

    @PostMapping(value = "/start")
    public void start(String empId){
        Staff staff=empService.getEmpByEmpId(empId);
        staff.seteStatus(staff.geteStatus()^1);
        empService.cascadeUpdate(staff);
        ResponseUtils.writeSuccessReponse(request,response,"成功啦！");
    }

    @RequestMapping(value = "/{empId}/check")
    public String check(@PathVariable(value = "empId")String empId,Model model){
        Staff staff=empService.getEmpByEmpId(empId);
        model.addAttribute("staff",staff);
        return "emp/emp_show";
    }

    @PostMapping(value = "/getJobList")
    public void getJobList(String deptId){
        List<Job> jobList=jobService.getAllJobByDeptId(deptId);
        List<Job> list=convertList(jobList);
        ResponseUtils.writeSuccessReponse(request,response,list);
    }

    private List<Job> convertList(List<Job> jobList) {
        List<Job> list=new ArrayList<>();
        for (Job job:jobList){
            Integer count=empParamService.getCountByJobId(job.getJobId());
            if (count<job.getVolume()){
                list.add(job);
            }
        }
        return list;
    }


}
