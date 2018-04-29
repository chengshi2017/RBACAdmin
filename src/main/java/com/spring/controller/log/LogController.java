package com.spring.controller.log;

import com.github.pagehelper.Page;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.Log;
import com.spring.model.LogType;
import com.spring.service.log.LogService;
import com.spring.service.log.LogTypeService;
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
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    public String toPage(Model model){
        //加载日志类型
        List<LogType> list=logTypeService.getAllVaildLogTypes();
        model.addAttribute("logTypes",list);
        return "log/page";
    }

    //加载data页面
    @RequestMapping(value = "/data",method = RequestMethod.POST)
    public String date(Integer pageNo, @RequestParam(defaultValue = "10") Integer pageSize, Model model){
        Page<Log> lists=logService.getAllLogs(new RowBounds((pageNo-1)*pageSize,pageSize));
        model.addAttribute("lists",lists);
        return "log/data";
    }

    //删除日志信息
    @RequestMapping(value = "{logId}/delete",method = RequestMethod.POST)
    public void delete(@PathVariable(value = "logId")String logId){
        logService.delete(logId);
        ResponseUtils.writeSuccessReponse(request,response,"删除日志信息成功");
    }
}
