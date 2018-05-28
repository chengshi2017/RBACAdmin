package com.spring.dao;

import com.github.pagehelper.Page;
import com.spring.model.Job;
import com.spring.param.JobFilter;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface JobMapper {
    int deleteByPrimaryKey(String jobId);

    int insert(Job record);

    int insertSelective(Job record);

    Job selectByPrimaryKey(String jobId);

    int updateByPrimaryKeySelective(Job record);

    int updateByPrimaryKey(Job record);

    Page<Job> getAllJobMessage(RowBounds rowBounds);

    List<Job> getAllJob();

    List<Job> getAllJobByJobName(String jobName);

    int batchDelete(List<String> list);

    Page<Job> getMessageByCondition(RowBounds rowBounds, JobFilter filter);

    Integer getCountByFilter(String startTime);
}