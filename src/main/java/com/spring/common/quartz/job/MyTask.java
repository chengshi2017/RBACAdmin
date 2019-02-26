package com.spring.common.quartz.job;

import com.spring.service.attend.AttendService;
import org.quartz.CronTrigger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @Author: Jeremy
 * @Date: 2018/7/17
 * @Time: 16:59
 * @Version: 1.0
 * @Describe:
 */
@Component
public class MyTask implements Job{

    private static final Logger LOGGER = LoggerFactory.getLogger(MyTask.class);

    @Autowired
    private AttendService attendService;

    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        boolean isExecute = false;  //是否已执行业务逻辑
        boolean flag = false;  //业务逻辑执行后返回结果

        try {
            //可以通过context拿到执行当前任务的quartz中的很多信息，如当前是哪个trigger在执行该任务
            CronTrigger trigger = (CronTrigger) context.getTrigger();
            String corn = trigger.getCronExpression();
            String jobName = trigger.getKey().getName();
            String jobGroup = trigger.getKey().getGroup();
            System.out.println("corn:"+corn);
            System.out.println("jobName:"+jobName);
            System.out.println("jobGroup:"+jobGroup);
        } catch (Exception e) {
            e.printStackTrace();
        }
        attendService.checkAttend();
        LOGGER.info("定时任务操作完成");
        LOGGER.info("考勤检查完成");
    }
}
