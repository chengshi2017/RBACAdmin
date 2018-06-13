package com.spring.common.quartz.repository;

import com.spring.common.quartz.domain.ScheduleJob;

import java.util.List;

/**
 * @Author: Jeremy
 * @Date: 2018/6/13
 * @Time: 15:25
 * @Version: 1.0
 * @Describe:
 */
public interface ScheduleJobRepository extends BaseRepository<ScheduleJob,Long> {

    List<ScheduleJob> findAllByJobStatus(String jobStatus);
}
