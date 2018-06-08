package com.spring.common.utils;

/**
 * @Author 施成
 * @Date 2018/2/11
 * @time 0:50
 * @Describe:
 */
public class Constants {

    public static class ResponseCode {
        public static final int success = 0;
        public static final int error = 1;
    }

    public static class Regular {
        public static final String onlineUser = "onlineUser";
    }

    public static class isAdmin{
        public static final  int isRoleAdmin= 0;
        public static final int notRolwAdmin =1;
    }

    public static class DateTimeFilter{
        public static final Integer count= null;
        public static final Integer today = -1;
        public static final Integer week = -7;
        public static final Integer month = -30;
        public static final Integer sixMonth = -180;
        public static final Integer year = -365;
    }

    //设置HR部门ID常量
    public static String DEPT_HR_ID = "126108720Q29700F";

    //判断新插入的用户信息是否为管理员账户
    public static boolean IS_USER_ADMIN = true;
    public static boolean NOT_USER_ADMIN = false;

    //设置信息的状态 0-异常 1-正常
    public static Integer IS_STATUS = 1;
    public static Integer NOT_STATUS = 0;

    //设置普通员工的UUID常量
    public static String ROLE_STAFF = "126304SL3U29700A";

    public static class AttendConstants{
        /**
         * 中午十二点，判定上下午
         */
        public static final Integer NOON_HOUR = 12;
        public static final Integer NOON_MINUTE = 00;

        /**
         * 早晚上班时间判定
         */
        public static final Integer MORNING_HOUR = 9;
        public static final Integer MORNING_MINUTE = 00;
        public static final Integer EVENING_HOUR = 17;
        public static final Integer EVENING_MINUTE = 00;

        /**
         * 缺勤一整天
         */
        public static final Integer ABSENCE_DAY = 480;

        /**
         * 考勤状态
         */
        public static final Integer ATTEND_STATUS_ABNORMAL = 0;  //异常
        public static final Integer ATTEND_STATUS_NORMAL = 1;    //正常
    }

}
