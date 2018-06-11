package com.spring.dao.attend;

import com.spring.model.attend.Attend;
import com.spring.model.attend.UserAttend;

import java.util.List;

public interface UserAttendMapper {
    int deleteByPrimaryKey(String userAttendId);

    int insert(Attend record);

    int insertSelective(UserAttend record);

    UserAttend selectByPrimaryKey(String userAttendId);

    int updateByPrimaryKeySelective(UserAttend record);

    int updateByPrimaryKey(UserAttend record);

    void batchInsert(List<Attend> list);
}