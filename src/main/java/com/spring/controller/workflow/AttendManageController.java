package com.spring.controller.workflow;

import com.github.pagehelper.Page;
import com.spring.controller.base.SuperController;
import com.spring.model.attend.Attend;
import com.spring.param.SystemFilter;
import com.spring.service.attend.AttendService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @Author: Jeremy
 * @Date: 2018/6/14
 * @Time: 18:38
 * @Version: 1.0
 * @Describe:
 */
@Controller
@RequestMapping(value = "/system/attend")
public class AttendManageController  extends SuperController{

    @Autowired
    private AttendService attendService;

    @RequestMapping(value = "/page")
    public String toPage(@RequestParam(defaultValue = "1")Integer pageNo,
                         @RequestParam(defaultValue = "10")Integer pageSize,
                         Model model){
        Page<Attend> lists = attendService.selectAll(new RowBounds((pageNo-1)*pageSize,pageSize));
        model.addAttribute("lists",lists);
        return "system/attend/page";
    }

    @RequestMapping(value = "/retrieve")
    public String retrieve(SystemFilter filter,Model model){
        Integer pageNo=filter.getPageNo();
        Integer pageSize=filter.getPageSize();
        Page<Attend> lists=attendService.selectAttendRecordByCondition(new RowBounds((pageNo-1)*pageSize,pageSize),filter);
        model.addAttribute("lists",lists);
        return "system/attend/page";
    }


}
