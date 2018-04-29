package com.spring.dao;

import com.github.pagehelper.Page;
import com.spring.model.Log;
import org.apache.ibatis.session.RowBounds;

public interface LogMapper {
    int deleteByPrimaryKey(String logId);

    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(Integer logId);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);

    Page<Log> getAllLogs(RowBounds rowBounds);
}