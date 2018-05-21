package com.spring.controller.dept;

import com.github.pagehelper.Page;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.Dept;
import com.spring.model.EmpParam;
import com.spring.param.DeptFilter;
import com.spring.service.dept.DeptService;
import com.spring.service.emp.EmpParamService;
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
 * @Author Sunny
 * @Date 2018/2/11
 * @time 9:30
 * @Describe:
 */
@Controller
@RequestMapping(value = "/dept")
public class DeptController extends SuperController{

    private static final Logger Log= LoggerFactory.getLogger(DeptController.class);

    @Autowired
    private DeptService deptService;

    @Autowired
    private EmpParamService empParamService;

    //加载page页面
    @RequiresPermissions(value = "dept:page")
    @RequestMapping(value = "/page")
    public String toPage(@RequestParam(defaultValue = "1") Integer pageNo,
                         @RequestParam(defaultValue = "10") Integer pageSize,
                         Model model){
        //加载部门名称
        List<Dept> deptList=deptService.getAllDept();
        model.addAttribute("dept",deptList);
        //加载页面数据
        Page<Dept> lists=deptService.getAllDeptMessage(new RowBounds((pageNo-1)*pageSize,pageSize));
        model.addAttribute("lists",lists);
        return "dept/deptList";
    }

    //对部门信息进行操作
    @RequestMapping(value = "/toUpdate",method = RequestMethod.GET)
    public String toAdd(Model model){
        return "dept/dept_add";
    }

    //对部门信息更新操作
    @RequestMapping(value = "{deptId}/toUpdate",method = RequestMethod.GET)
    public String toUpdate(@PathVariable("deptId") String deptId, Model model){
        Dept dept=deptService.getDeptById(deptId);
        model.addAttribute("dept",dept);
        return "dept/dept_add";
    }

    //编辑部门信息
    @RequestMapping(value = "/toUpdate",method = RequestMethod.POST)
    public void update(Dept info){
        //根据id判断操作的种类
        if(null==info.getDeptId()){
            deptService.insert(info);
            ResponseUtils.writeSuccessReponse(request,response,"新增部门信息成功");
        }else {
            deptService.update(info);
            ResponseUtils.writeSuccessReponse(request,response,"修改部门信息成功");
        }
    }

    //根据部门id删除部门信息
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public void delete(String deptId){
        List<EmpParam> deptList=empParamService.getAllByDeptId(deptId);
        if (deptList!=null&&deptList.size()>0){
            ResponseUtils.writeErrorResponse(request,response,"请先分配部门中的员工");
            throw new MyException("部门中存在员工，不允许删除");
        }
        deptService.delete(deptId);
        ResponseUtils.writeSuccessReponse(request,response,"删除员工信息成功");
    }

    //根据条件查询部门信息
    @PostMapping(value = "/retrieve")
    public String getMessageByCondition(DeptFilter filter,Model model){
        Integer pageNo=filter.getPageNo();
        Integer pageSize=filter.getPageSize();
        Page<Dept> lists=deptService.getMessageByCondition(new RowBounds((pageNo-1)*pageSize,pageSize),filter);
        model.addAttribute("lists",lists);
        return "dept/deptList";
    }

    //批量删除部门信息
    @PostMapping(value = "/batchDelete")
    public void batchDelete(String checkedId){
        String[] data=checkedId.split(",");
        List<String> list=Arrays.asList(data);
        for (String deptId: list){
            List<EmpParam> list1=empParamService.getAllByDeptId(deptId);
            if (list1!=null && list1.size()>0){
                ResponseUtils.writeErrorResponse(request,response,"请先分配部门中的员工");
                throw new MyException("部门中存在员工，不允许删除");
            }
        }
        deptService.batchDelete(list);
        ResponseUtils.writeSuccessReponse(request,response,"批量删除部门信息成功");
    }

    //部门启用
    @PostMapping(value = "/start")
    public void start(String deptId){
        Dept dept=deptService.getDeptById(deptId);
        dept.setStatus(dept.getStatus()^1);
        deptService.update(dept);
        ResponseUtils.writeSuccessReponse(request,response,"成功啦");
    }
}
