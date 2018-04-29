package com.spring.dao;

import com.github.pagehelper.Page;
import com.spring.model.Notice;
import org.apache.ibatis.session.RowBounds;

public interface NoticeMapper {
    int deleteByPrimaryKey(String noticeId);

    int insert(Notice record);

    int insertSelective(Notice record);

    Notice selectByPrimaryKey(String noticeId);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKeyWithBLOBs(Notice record);

    int updateByPrimaryKey(Notice record);

    Page<Notice> getAllMessageNotice(RowBounds rowBounds);
}