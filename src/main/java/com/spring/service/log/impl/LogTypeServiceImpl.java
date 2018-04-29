package com.spring.service.log.impl;

import com.spring.dao.LogTypeMapper;
import com.spring.model.LogType;
import com.spring.service.log.LogTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 施成
 * @Date 2018/2/11
 * @time 1:15
 * @Describe:
 */
@Service
public class LogTypeServiceImpl implements LogTypeService {

    @Autowired
    private LogTypeMapper logTypeMapper;

    @Override
    public List<LogType> getAllVaildLogTypes() {
        return logTypeMapper.getAllVaildLogTypes();
    }
}
