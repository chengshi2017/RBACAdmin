package com.spring.service.log.impl;

import com.github.pagehelper.Page;
import com.spring.common.Enums.LogTypeEnums;
import com.spring.common.Enums.StatusEnums;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.Constants;
import com.spring.common.utils.DateUtils;
import com.spring.common.utils.UUID;
import com.spring.dao.LogMapper;
import com.spring.service.log.LogService;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @Author 施成
 * @Date 2018/2/11
 * @time 1:14
 * @Describe:
 */
@Service
@Transactional
public class LogServiceImpl implements LogService{

    private static final Logger Log= LoggerFactory.getLogger(LogServiceImpl.class);

    @Autowired
    private LogMapper logMapper;

    @Override
    public Page<com.spring.model.Log> getAllLogs(RowBounds rowBounds) {
        return logMapper.getAllLogs(rowBounds);
    }


    @Override
    public void delete(String logId) {
        if(logMapper.deleteByPrimaryKey(logId)<1){
            throw new MyException("删除日志信息失败");
        }else
            Log.info("删除日志信息成功");
    }

    @Override
    public void addloginLog(com.spring.model.Log log) {
        log.setLogId(UUID.getUUID());
        log.setOperateTime(new Date());
        log.setStatus(StatusEnums.VALID.getValue());
        log.setResponseCode(Constants.ResponseCode.success+"");
        if(logMapper.insert(log)<1){
            throw new MyException("写入登录日志失败");
        }
    }

    @Override
    public void addOperateLog(com.spring.model.Log log) {
        log.setLogId(UUID.getUUID());
        //设置操作时间
        log.setOperateTime(DateUtils.today());
        //设置日志类型
        log.setLogTypeId(LogTypeEnums.OPERTE.getValue());
        log.setStatus(StatusEnums.VALID.getValue());
        log.setRemark("操作日志");
        if (logMapper.insert(log)<1){
            throw new MyException("写入操作日志失败");
        }
    }

    @Override
    public void batchDelete(List<String> list) {
        if (logMapper.batchDelete(list)<1){
            throw new MyException("批量删除日志信息失败");
        }
    }
}
