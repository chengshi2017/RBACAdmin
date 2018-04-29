package com.spring.service.notice.impl;

import com.github.pagehelper.Page;
import com.spring.common.exceptions.MyException;
import com.spring.common.utils.DateUtils;
import com.spring.common.utils.UUID;
import com.spring.dao.NoticeMapper;
import com.spring.model.Notice;
import com.spring.service.notice.NoticeService;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author 施成
 * @Date 2018/2/20
 * @time 23:47
 * @Describe:
 */
@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {

    public static final Logger Log= LoggerFactory.getLogger(NoticeServiceImpl.class);

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public Page<Notice> getAllMessageNotice(RowBounds rowBounds) {
        return noticeMapper.getAllMessageNotice(rowBounds);
    }

    @Override
    public Notice getNoticeById(String noticeId) {
        return noticeMapper.selectByPrimaryKey(noticeId);
    }

    @Override
    public void insert(Notice notice) {
        notice.setNoticeId(UUID.getUUID());
        notice.setCreateTime(DateUtils.today());
        if(noticeMapper.insert(notice)<1){
            throw new MyException("新增公告信息失败");
        }
    }

    @Override
    public void update(Notice notice) {
        if(noticeMapper.updateByPrimaryKey(notice)<1){
            throw new MyException("修改公告信息失败");
        }
    }

    @Override
    public void delete(String noticeId) {
        if(noticeMapper.deleteByPrimaryKey(noticeId)<1){
            throw new MyException("删除公告信息失败");
        }
    }
}
