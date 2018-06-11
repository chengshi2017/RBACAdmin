package com.spring.service.attend;

import com.github.pagehelper.Page;
import com.spring.model.attend.Attend;
import com.spring.model.permission.User;
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
}
