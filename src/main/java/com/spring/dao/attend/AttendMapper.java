package com.spring.dao.attend;

import com.github.pagehelper.Page;
import com.spring.model.attend.Attend;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface AttendMapper {
    int deleteByPrimaryKey(String attendId);

    int insert(Attend record);

    int insertSelective(Attend record);

    Attend selectByPrimaryKey(String attendId);

    int updateByPrimaryKeySelective(Attend record);

    int updateByPrimaryKey(Attend record);

    Attend getTodayRecordAttend(String userId);

    List<String> getUserIdAbsence();

    void batchInsert(List<Attend> list);

    List<Attend> getTodayEveningAbsence();

    List<Attend> getAllAttendRecord(String userId);

    List<Attend> getCurrentMonthAttendRecord(String userId);

    List<Attend> getCurrentWeekAttendRecord(String userId);

    List<Attend> getLastMonthAttendRecord(String userId);
}