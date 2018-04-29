package com.spring.controller.dept;

import com.github.pagehelper.Page;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.Dept;
import com.spring.service.dept.DeptService;
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

    //加载page页面
    @RequiresPermissions(value = "dept:page")
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    public String toPage(){
        return "dept/page";
    }

    //加载date数据
    @RequestMapping(value = "/data",method = RequestMethod.POST)
    public String date(Integer pageNo, @RequestParam(defaultValue = "10") Integer pageSize, Model model){
        Page<Dept> lists=deptService.getAllDeptMessage(new RowBounds((pageNo-1)*pageSize,pageSize));
        model.addAttribute("lists",lists);
        return "dept/data";

    }

    //对部门信息进行操作
    @RequestMapping(value = "/toUpdate",method = RequestMethod.GET)
    public String toAdd(Model model){
        return "dept/update";
    }

    //对部门信息更新操作
    @RequestMapping(value = "{deptId}/toUpdate",method = RequestMethod.GET)
    public String toUpdate(@PathVariable("deptId") String deptId, Model model){
        Dept dept=deptService.getDeptById(deptId);
        model.addAttribute("dept",dept);
        return "dept/update";
    }

    //编辑部门信息
    @RequestMapping(value = "toUpdate",method = RequestMethod.POST)
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
    @RequestMapping(value = "{deptId}/delete",method = RequestMethod.POST)
    public void delete(@PathVariable("deptId") String deptId){
        deptService.delete(deptId);
        ResponseUtils.writeSuccessReponse(request,response,"删除员工信息成功");
    }
}
