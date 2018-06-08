package com.spring.dao.attend;

import com.spring.model.attend.AttendApply;

public interface AttendApplyMapper {
    int deleteByPrimaryKey(String attendReattendId);

    int insert(AttendApply record);

    int insertSelective(AttendApply record);

    AttendApply selectByPrimaryKey(String attendReattendId);

    int updateByPrimaryKeySelective(AttendApply record);

    int updateByPrimaryKey(AttendApply record);
}