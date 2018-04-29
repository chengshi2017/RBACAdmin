package com.spring.service.job.impl;

import com.github.pagehelper.Page;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.UUID;
import com.spring.dao.JobMapper;
import com.spring.model.Job;
import com.spring.service.job.JobService;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author 施成
 * @Date 2018/2/20
 * @time 23:06
 * @Describe:
 */
@Service
@Transactional
public class JobServiceImpl implements JobService {

    private static final Logger Log= LoggerFactory.getLogger(JobServiceImpl.class);

    @Autowired
    private JobMapper jobMapper;

    @Override
    public Page<Job> getAllJobMessage(RowBounds rowBounds) {
        return jobMapper.getAllJobMessage(rowBounds);
    }

    @Override
    public Job getJobMessageById(String jobId) {
        return jobMapper.selectByPrimaryKey(jobId);
    }

    @Override
    public void insert(Job job) {
        job.setJobId(UUID.getUUID());
        if(jobMapper.insert(job)<1){
            throw new MyException("新增职位信息失败");
        }
    }

    @Override
    public void update(Job info) {
        if(jobMapper.updateByPrimaryKey(info)<1){
            throw new MyException("修改职位信息失败");
        }
    }

    @Override
    public void delete(String jobId) {
        if(jobMapper.deleteByPrimaryKey(jobId)<1){
            throw new MyException("删除职位信息失败");
        }
    }

    @Override
    public List<Job> getAllJob() {
        return jobMapper.getAllJob();
    }
}
