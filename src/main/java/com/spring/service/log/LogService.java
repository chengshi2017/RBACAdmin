package com.spring.service.log;

import com.github.pagehelper.Page;
import com.spring.model.Log;
import com.spring.param.LogFilter;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

/**
 * @Author 施成
 * @Date 2018/2/11
 * @time 0:04
 * @Describe:
 */
public interface LogService {
    Page<Log> getAllLogs(RowBounds rowBounds);

    void delete(String logId);

    void addloginLog(Log log);

    void addOperateLog(Log log);

    void batchDelete(List<String> list);

    Log getLogsById(String logId);

    Page<Log> getLogsByCondition(RowBounds rowBounds,LogFilter filter);
}
