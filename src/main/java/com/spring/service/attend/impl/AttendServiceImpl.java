package com.spring.service.attend.impl;

import com.spring.common.exceptions.MyException;
import com.spring.common.utils.Constants;
import com.spring.common.utils.DateUtils;
import com.spring.common.utils.UUID;
import com.spring.dao.attend.AttendMapper;
import com.spring.dao.attend.UserAttendMapper;
import com.spring.model.attend.Attend;
import com.spring.model.permission.User;
import com.spring.service.attend.AttendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @Author: Jeremy
 * @Date: 2018/6/6
 * @Time: 16:49
 * @Version: 1.0
 * @Describe:
 */
@Service@Transactional
public class AttendServiceImpl implements AttendService {

    @Autowired
    private AttendMapper attendMapper;

    @Autowired
    private UserAttendMapper userAttendMapper;

    @Override
    public void sign(User user) {

        Attend attend=new Attend();
        //关联表UUID
        attend.setUserAttendId(UUID.getUUID());
        //设置当前考勤数据UUID
        attend.setAttendId(UUID.getUUID());
        //设置当前考勤数据对应的用户信息
        attend.setUserId(user.getUserId());
        //考勤日期
        Date today=new Date();
        attend.setAttendDate(today);
        //打卡是星期几
        attend.setAttendWeek(DateUtils.getCurrentWeek());
        /**
         * 打卡时间
         */
        //查询当天此人有没有打卡记录
        List<Attend> attendList=attendMapper.getTodayRecordAttend(user.getUserId());
        //判定上下午
        Date noon = DateUtils.getDate(Constants.AttendConstants.NOON_HOUR,Constants.AttendConstants.NOON_MINUTE);
        //判定早上是否迟到
        Date morningDate = DateUtils.getDate(Constants.AttendConstants.MORNING_HOUR,Constants.AttendConstants.MORNING_MINUTE);
        //第一次打卡
        if (attendList.size()==0){
            if (today.compareTo(noon)<=0){
                //上午打卡
                attend.setAttendMorning(today);
                //计算是否早上迟到
                if (today.compareTo(morningDate)>0){
                    attend.setAttendStatus(Constants.AttendConstants.ATTEND_STATUS_ABNORMAL);
                    attend.setAbsence(DateUtils.getMinute(morningDate,today));
                }
            }else {
                attend.setAttendEvening(today);
            }
            //关联插入
            attendMapper.insert(attend);
            //向关联表中插入数据
            userAttendMapper.insert(attend);
        }else {
            if (today.compareTo(noon)>0){
                //下午打卡
                Date eveningDate = DateUtils.getDate(Constants.AttendConstants.EVENING_HOUR,Constants.AttendConstants.EVENING_MINUTE);
                attend.setAttendEvening(today);
                //早退
                if (today.compareTo(eveningDate)<0){
                    attend.setAttendStatus(Constants.AttendConstants.ATTEND_STATUS_ABNORMAL);
                    int eveningAbsence=DateUtils.getMinute(today,eveningDate);
                    int morningAbsence=attendList.get(0).getAbsence();
                    int totalAbsence=morningAbsence+eveningAbsence;
                    attend.setAbsence(totalAbsence);
                }
                attendMapper.updateByPrimaryKeySelective(attend);
            }
        }
    }
}
