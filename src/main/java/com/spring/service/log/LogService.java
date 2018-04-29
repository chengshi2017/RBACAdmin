package com.spring.service.log;

import com.github.pagehelper.Page;
import com.spring.model.Log;
import org.apache.ibatis.session.RowBounds;

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
}
