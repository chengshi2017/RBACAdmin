package com.spring.service.job;

import com.github.pagehelper.Page;
import com.spring.model.Job;
import com.spring.param.JobFilter;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

/**
 * @Author 施成
 * @Date 2018/2/12
 * @time 23:56
 * @Describe:
 */
public interface JobService {
    Page<Job> getAllJobMessage(RowBounds rowBounds);

    Job getJobMessageById(String jobId);

    void insert(Job info);

    void update(Job info);

    void delete(String jobId);

    List<Job> getAllJob();

    void batchDelete(List<String> list);

    Page<Job> getMessageByCondition(RowBounds rowBounds, JobFilter filter);

    Integer getCountByFilter(Integer filter);

    List<Job> getAllJobByDeptId(String deptHrId);
}
