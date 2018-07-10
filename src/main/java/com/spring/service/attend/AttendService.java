package com.spring.service.attend;

import com.github.pagehelper.Page;
import com.spring.model.attend.Attend;
import com.spring.model.permission.User;
import com.spring.param.AttendFilter;
import com.spring.param.SystemFilter;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

/**
 * @Author: Jeremy
 * @Date: 2018/6/6
 * @Time: 16:25
 * @Version: 1.0
 * @Describe:
 */
public interface AttendService {
    void sign(User user);

    void checkAttend();

    List<Attend> getAllAttendRecord(String userId,String id);

    Attend getMessageByDate(AttendFilter filter);

    Page<Attend> selectAll(RowBounds rowBounds);

    Page<Attend> selectAttendRecordByCondition(RowBounds rowBounds, SystemFilter filter);

    Page<Attend> selectAttend(RowBounds rowBounds, String userId);

    Attend getAttendRecordByAttendId(String attendId);

    Page<Attend> getAllAttendByRecord(RowBounds rowBounds,String userId, String id);
}
