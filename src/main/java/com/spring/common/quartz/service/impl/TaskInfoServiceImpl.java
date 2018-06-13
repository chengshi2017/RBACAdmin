package com.spring.common.quartz.service.impl;

import com.spring.common.quartz.service.ITaskInfoService;
import com.spring.service.attend.AttendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * @Author: Jeremy
 * @Date: 2018/6/13
 * @Time: 15:56
 * @Version: 1.0
 * @Describe:
 */
@Service("taskInfo")
@Transactional
public class TaskInfoServiceImpl implements ITaskInfoService {

    @Autowired
    private AttendService attendService;

    @Override
    public void execute() {
        System.out.println("任务执行开始===============任务执行开始");
        attendService.checkAttend();
        System.out.println("任务执行结束===============任务执行结束");
    }
}
