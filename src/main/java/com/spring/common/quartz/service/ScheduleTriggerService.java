package com.spring.common.quartz.service;

import com.spring.common.quartz.Repository.CScheduleTriggerRepository;
import com.spring.common.quartz.bean.CScheduleTrigger;
import org.quartz.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Jeremy
 * @Date: 2018/7/16
 * @Time: 11:10
 * @Version: 1.0
 * @Describe:
 */
@Service
public class ScheduleTriggerService {

    private static final Logger Log = LoggerFactory.getLogger(ScheduleTriggerService.class);

    @Autowired
    private Scheduler scheduler;

    @Autowired
    private CScheduleTriggerRepository triggerRepository;

    @Scheduled(cron = "0 0 * * * ?")
    public void refreshTrigger(){

        try {
            List<CScheduleTrigger> jobList= triggerRepository.findAll();
            if (jobList!=null){
                for (CScheduleTrigger scheduleJob: jobList){
                    String status = scheduleJob.getStatus();  //该触发器目前的状态
                    TriggerKey triggerKey=TriggerKey.triggerKey(scheduleJob.getJobName(),scheduleJob.getJobGroup());
                    CronTrigger trigger= (CronTrigger) scheduler.getTrigger(triggerKey);
                    //说明本条任务还没有添加到quartz中
                    if (trigger == null){
                        if (status.equals("0")){
                            continue;
                        }

                        JobDetail jobDetail = null;
                        try {
                            //创建jobDetail（数据库中job_name存的任务全路径，这里就可以动态的把任务注入到JobDetail中）
                            jobDetail=JobBuilder.newJob((Class<? extends Job>) Class.forName(scheduleJob.getJobName())).withIdentity(scheduleJob.getJobName(),scheduleJob.getJobGroup()).build();
                            //表达式调度构建器
                            CronScheduleBuilder scheduleBuilder=CronScheduleBuilder.cronSchedule(scheduleJob.getCron());
                            trigger=TriggerBuilder.newTrigger().withIdentity(scheduleJob.getJobName(),scheduleJob.getJobGroup()).withSchedule(scheduleBuilder).build();
                            scheduler.scheduleJob(jobDetail,trigger);
                        } catch (ClassNotFoundException e) {
                            e.printStackTrace();
                        }
                    }
                    //已经添加到quartz中
                    else {
                        //trigger已存在，先判断是否需要删除，如果不需要，再判断时间是否有改变
                        if (status.equals("0")){
                            JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(),scheduleJob.getJobGroup());
                            scheduler.deleteJob(jobKey);
                            continue;
                        }
                        //当前定时器时间表达式
                        String currentCron = trigger.getCronExpression();
                        String searchCron = scheduleJob.getCron();
                        if (currentCron.equals(searchCron)){
                            //表达式调度构建器
                            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(searchCron);

                            //按照新的时间表达式重新构建trigger
                            trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();

                            //按照新的trigger去部署任务
                            scheduler.rescheduleJob(triggerKey,trigger);
                        }
                    }
                }
            }
        } catch (SchedulerException e) {
            Log.error("定时任务每日刷新触发器任务异常，在ScheduleTriggerServiceImpl的方法refreshTrigger中，异常信息：", e);
        }

    }

}
