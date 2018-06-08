package com.spring.dao.attend;

import com.spring.model.attend.Apply;

public interface ApplyMapper {
    int deleteByPrimaryKey(String reAttendId);

    int insert(Apply record);

    int insertSelective(Apply record);

    Apply selectByPrimaryKey(String reAttendId);

    int updateByPrimaryKeySelective(Apply record);

    int updateByPrimaryKey(Apply record);
}