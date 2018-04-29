package com.spring.dao;

import com.spring.model.LogType;

import java.util.List;

public interface LogTypeMapper {
    int deleteByPrimaryKey(Integer logTypeId);

    int insert(LogType record);

    int insertSelective(LogType record);

    LogType selectByPrimaryKey(Integer logTypeId);

    int updateByPrimaryKeySelective(LogType record);

    int updateByPrimaryKey(LogType record);

    List<LogType> getAllVaildLogTypes();
}