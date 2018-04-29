package com.spring.service.notice;

import com.github.pagehelper.Page;
import com.spring.model.Notice;
import org.apache.ibatis.session.RowBounds;

/**
 * @Author 施成
 * @Date 2018/2/15
 * @time 14:03
 * @Describe:
 */
public interface NoticeService {

    Page<Notice> getAllMessageNotice(RowBounds rowBounds);

    Notice getNoticeById(String noticeId);

    void insert(Notice notice);

    void update(Notice notice);

    void delete(String noticeId);
}
