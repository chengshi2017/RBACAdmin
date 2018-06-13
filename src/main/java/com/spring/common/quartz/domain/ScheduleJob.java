package com.spring.common.quartz.domain;

import javax.persistence.*;

/**
 * @Author: Jeremy
 * @Date: 2018/6/13
 * @Time: 15:23
 * @Version: 1.0
 * @Describe:
 */
@Entity
@Table
public class ScheduleJob {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String jobName;
    private String cronExpression;
    private String springId;
    private String methodName;
    private String jobStatus;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getCronExpression() {
        return cronExpression;
    }

    public void setCronExpression(String cronExpression) {
        this.cronExpression = cronExpression;
    }

    public String getSpringId() {
        return springId;
    }

    public void setSpringId(String springId) {
        this.springId = springId;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public String getJobStatus() {
        return jobStatus;
    }

    public void setJobStatus(String jobStatus) {
        this.jobStatus = jobStatus;
    }
}
