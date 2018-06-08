package com.spring.dao.attend;

import com.spring.model.attend.Attend;
import com.spring.model.attend.UserAttend;

public interface UserAttendMapper {
    int deleteByPrimaryKey(String userAttendId);

    int insert(Attend record);

    int insertSelective(UserAttend record);

    UserAttend selectByPrimaryKey(String userAttendId);

    int updateByPrimaryKeySelective(UserAttend record);

    int updateByPrimaryKey(UserAttend record);
}