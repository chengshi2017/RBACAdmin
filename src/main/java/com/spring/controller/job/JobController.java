package com.spring.controller.job;

import com.github.pagehelper.Page;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.EmpParam;
import com.spring.model.Job;
import com.spring.param.JobFilter;
import com.spring.service.emp.EmpParamService;
import com.spring.service.job.JobService;
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

    @Autowired
    private EmpParamService empParamService;

    //加载page页面
    @RequiresPermissions(value = "job:page")
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    public String toPage(@RequestParam(defaultValue = "1") Integer pageNo,
                         @RequestParam(defaultValue = "10") Integer pageSize,
                         Model model){
        //获取所有职位信息
        List<Job> jobList=jobService.getAllJob();
        model.addAttribute("jobList",jobList);
        Page<Job> lists=jobService.getAllJobMessage(new RowBounds((pageNo-1)*pageSize,pageSize));
        model.addAttribute("lists",lists);
        return "job/jobList";
    }

    //添加职位信息
    @RequestMapping(value = "/toUpdate", method = RequestMethod.GET)
    public String toAdd(Model model){
        return "job/job_add";
    }

    //修改职位相关信息
    @RequestMapping(value = "/{jobId}/toUpdate", method = RequestMethod.GET)
    public String toUpdate(@PathVariable("jobId") String jobId, Model model){
        Job job=jobService.getJobMessageById(jobId);
        model.addAttribute("job",job);
        return "job/job_add";
    }

    @RequestMapping(value = "/toUpdate", method = RequestMethod.POST)
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
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(String jobId){
        List<EmpParam> list=empParamService.getJobMessageById(jobId);
        if (list!=null&&list.size()>0){
            ResponseUtils.writeSuccessReponse(request,response,"仍有员工处于此岗位，请重新分配后删除");
            throw new MyException("存在关联信息，无法删除");
        }
        jobService.delete(jobId);
        ResponseUtils.writeSuccessReponse(request,response,"删除职位信息成功");
    }

    @PostMapping(value = "/batchDelete")
    public void batchDelete(String checkedId){
        String[] record=checkedId.split(",");
        List<String> list=Arrays.asList(record);
        for (String jobId: list){
            List<EmpParam> jobList=empParamService.getJobMessageById(jobId);
            if (jobList!=null&&jobList.size()>0){
                ResponseUtils.writeErrorResponse(request,response,"仍有员工处于需要删除岗位，请重新分配后删除");
                throw new MyException("存在关联信息，不能删除");
            }
        }
        jobService.batchDelete(list);
        ResponseUtils.writeSuccessReponse(request,response,"批量删除职位信息成功！");
    }

    @PostMapping(value = "/start")
    public void start(String jobId){
        Job job=jobService.getJobMessageById(jobId);
        job.setStatus(job.getStatus()^1);
        jobService.update(job);
        ResponseUtils.writeSuccessReponse(request,response,"成功啦！");
    }

    @PostMapping(value = "retrieve")
    public String getMessageByCondition(JobFilter filter, Model model){
        Integer pageNo=filter.getPageNo();
        Integer pageSize=filter.getPageSize();
        Page<Job> lists=jobService.getMessageByCondition(new RowBounds((pageNo-1)*pageSize,pageSize),filter);
        model.addAttribute("lists",lists);
        return "job/jobList";
    }
}
