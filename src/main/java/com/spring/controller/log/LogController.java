package com.spring.controller.log;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.Log;
import com.spring.model.LogType;
import com.spring.param.LogFilter;
import com.spring.service.log.LogService;
import com.spring.service.log.LogTypeService;
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
 * @Author 施成
 * @Date 2018/2/10
 * @time 22:33
 * @Describe:
 */
@Controller
@RequestMapping(value = "/log")
public class LogController extends SuperController {

    private static final Logger Log= LoggerFactory.getLogger(LogController.class);

    @Autowired
    private LogTypeService logTypeService;

    @Autowired
    private LogService logService;

    //加载page页面
    @RequiresPermissions(value = "log:page")
    @RequestMapping(value = "/page")
    public String toPage(@RequestParam(defaultValue = "1")Integer pageNo,
                         @RequestParam(defaultValue = "10")Integer pageSize,
                         LogFilter filter,Model model){
        //加载日志类型
        List<LogType> list=logTypeService.getAllVaildLogTypes();
        model.addAttribute("logTypes",list);
        //加载日志数据
        Page<Log> lists=logService.getAllLogs(new RowBounds((pageNo-1)*pageSize,pageSize));
        model.addAttribute("lists",lists);
        return "log/logList";
    }

    //删除日志信息
    @RequestMapping(value = "{logId}/delete",method = RequestMethod.POST)
    public void delete(@PathVariable(value = "logId")String logId){
        logService.delete(logId);
        ResponseUtils.writeSuccessReponse(request,response,"删除日志信息成功");
    }

    //批量删除日志信息
    @PostMapping(value = "/batchDelete")
    public void batchDelete(String checkedId){
        String[] logId=checkedId.split(",");
        List<String> list=Arrays.asList(logId);
        logService.batchDelete(list);
        ResponseUtils.writeSuccessReponse(request,response,"批量删除日志信息成功");
    }

    //根据id查询日志信息
    @GetMapping(value = "/{logId}/check")
    public String check(@PathVariable(value = "logId") String logId, Model model){
        Log log=logService.getLogsById(logId);
        model.addAttribute("log",log);
        return "log/logShow";
    }

    //根据条件查询日志信息
    @PostMapping(value = "/retrieve")
    public String getMessage(LogFilter filter,Model model){
        int pageNo=filter.getPageNo();
        int pageSize=filter.getPageSize();
        Page<Log> lists=logService.getLogsByCondition(new RowBounds((pageNo-1)*pageSize,pageSize),filter);
        model.addAttribute("lists",lists);
        return "log/logList";
    }
}
