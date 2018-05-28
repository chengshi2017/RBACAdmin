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
}
