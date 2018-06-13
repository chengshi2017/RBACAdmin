package com.spring.common.quartz.task;

import com.spring.common.quartz.domain.ScheduleJob;
import com.spring.common.quartz.util.SpringUtil;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.lang.reflect.Method;

/**
 * @Author: Jeremy
 * @Date: 2018/6/13
 * @Time: 15:34
 * @Version: 1.0
 * @Describe:
 */
public class QuartzFactory implements Job {

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        //获取调度数据
        ScheduleJob scheduleJob = (ScheduleJob) jobExecutionContext.getMergedJobDataMap().get("scheduleJob");
        //获取对应的Bean
        Object object = SpringUtil.getBean(scheduleJob.getSpringId());
        try {
            //利用反射执行对应方法
            Method method = object.getClass().getMethod(scheduleJob.getMethodName());
            method.invoke(object);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
