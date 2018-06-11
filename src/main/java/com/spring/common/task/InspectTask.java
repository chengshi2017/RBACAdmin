package com.spring.common.task;

import com.spring.service.attend.AttendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @Author: Jeremy
 * @Date: 2018/6/8
 * @Time: 20:03
 * @Version: 1.0
 * @Describe: 检查考勤数据，每天晚上12点定时执行
 */
public class InspectTask {

    @Autowired
    private AttendService attendService;

    public void InspectAttend(){
        attendService.checkAttend();
    }

}
