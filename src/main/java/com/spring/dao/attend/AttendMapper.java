package com.spring.dao.attend;

import com.spring.model.attend.Attend;

import java.util.List;

public interface AttendMapper {
    int deleteByPrimaryKey(String attendId);

    int insert(Attend record);

    int insertSelective(Attend record);

    Attend selectByPrimaryKey(String attendId);

    int updateByPrimaryKeySelective(Attend record);

    int updateByPrimaryKey(Attend record);

    List<Attend> getTodayRecordAttend(String userId);
}