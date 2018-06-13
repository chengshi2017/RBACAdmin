package com.spring.common.quartz.task;

import com.spring.common.quartz.service.ITaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

/**
 * @Author: Jeremy
 * @Date: 2018/6/13
 * @Time: 15:35
 * @Version: 1.0
 * @Describe:
 */
@Component
public class TaskSchedule implements CommandLineRunner {

    @Autowired
    private ITaskService taskService;

    /**
     * 任务调度开始
     * @param strings
     * @throws Exception
     */
    @Override
    public void run(String... strings) throws Exception {
        System.out.println("任务调度开始==============任务调度开始");
        taskService.timingTask();
        System.out.println("任务调度结束==============任务调度结束");
    }
}
