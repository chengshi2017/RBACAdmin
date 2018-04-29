package com.spring.controller.job;

import com.github.pagehelper.Page;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.Job;
import com.spring.service.job.JobService;
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
 * @Author 施成
 * @Date 2018/2/12
 * @time 23:51
 * @Describe:
 */
@Controller
@RequestMapping(value = "/job")
public class JobController extends SuperController {

    private static final Logger Log= LoggerFactory.getLogger(JobController.class);

    @Autowired
    private JobService jobService;

    //加载page页面
    @RequiresPermissions(value = "job:page")
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    public String toPage(){
        return "job/page";
    }

    //加载date数据页面
    @RequestMapping(value = "/data", method = RequestMethod.POST)
    public String date(Integer pageNo, @RequestParam(defaultValue = "10")Integer pageSize, Model model){
        Page<Job> lists=jobService.getAllJobMessage(new RowBounds((pageNo-1)*pageSize,pageSize));
        model.addAttribute("lists",lists);
        return "job/data";
    }

    //添加职位信息
    @RequestMapping(value = "/toUpdate", method = RequestMethod.GET)
    public String toAdd(Model model){
        return "job/update";
    }

    //修改职位相关信息
    @RequestMapping(value = "{jobId}/toUpdate", method = RequestMethod.GET)
    public String toUpdate(@PathVariable("jobId") String jobId, Model model){
        Job job=jobService.getJobMessageById(jobId);
        model.addAttribute("job",job);
        return "job/update";
    }

    @RequestMapping(value = "toUpdate", method = RequestMethod.POST)
    public void toUpdate(Job info){
        //根据传入的信息判断进行的操作
        if(null==info.getJobId()){
            jobService.insert(info);
            ResponseUtils.writeSuccessReponse(request,response,"新增职位信息成功");
        }else {
            jobService.update(info);
            ResponseUtils.writeSuccessReponse(request,response,"修改职位信息成功");
        }
    }

    //根据职位id删除职位信息
    @RequestMapping(value = "/{jobId}/delete", method = RequestMethod.POST)
    public void delete(@PathVariable("jobId") String jobId){
        jobService.delete(jobId);
        ResponseUtils.writeSuccessReponse(request,response,"D删除职位信息成功");
    }
}
