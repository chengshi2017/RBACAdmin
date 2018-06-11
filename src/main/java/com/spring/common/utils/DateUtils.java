package com.spring.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

/**
 * @Author 施成
 * @Date 2018/2/12
 * @time 23:18
 * @Describe:
 */
public class DateUtils {

    private static final SimpleDateFormat datetimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static String SIMPLE_DATE_PATTERN = "yyyy-MM-dd";

    public static String SIMPLE_DATE_HOURS_PATTERN = "yyyy-MM-dd HH:mm:ss";

    public static final String SDF_YMD_PATTERN = "yyyyMMdd";

    public static final String SDF_YM = "yyyy-MM";

    public static final String SDF_MINUTS = "yyyy-MM-dd HH:mm";

    public static final String SDF_HOUR_MINUTS = "HH:mm";

    public static final String SDF_MD_PATTERN = "MM-dd";

    public static final String SDF_MD_HM_PATTERN = "MM-dd HH:mm";

    public static final String SDF_YMDHMS_PATTERN = "yyyyMMddHHmmss";


    public static Date stringToDate(String str, String format) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        sdf.setLenient(Boolean.FALSE.booleanValue());
        Date date = sdf.parse(str);
        return date;
    }

    private static final long daytimes = 86400000L;
    public static final String YYMMDDHHMMSS = "yyMMddhhmmss";

    public static Date parseDatetime(String datetime, String pattern) throws ParseException {
        SimpleDateFormat format = (SimpleDateFormat) datetimeFormat.clone();
        format.applyPattern(pattern);
        return format.parse(datetime);
    }

    public static Date getDateByFormat(Date sourceDate, String format) throws ParseException {
        SimpleDateFormat f = new SimpleDateFormat(format);
        String dateString = f.format(sourceDate);
        Date date = f.parse(dateString);
        return date;
    }

    public static Date getDateByFormat(String sourceDateStr, String format) {
        SimpleDateFormat f = new SimpleDateFormat(format);
        Date date = null;
        try {
            date = f.parse(sourceDateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    public static String formatDatetime(Date date) {
        return datetimeFormat.format(date);
    }

    public static String formatDatetime(Date date, String pattern) {
        SimpleDateFormat customFormat = (SimpleDateFormat) datetimeFormat.clone();
        customFormat.applyPattern(pattern);
        return customFormat.format(date);
    }

    /**
     * 获取当天开始时间
     *
     * @return
     * @throws ParseException
     */
    public static Date getTodayStartTime() throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return datetimeFormat.parse(format.format(new Date()) + " 00:00:00");
    }

    /**
     * 获取当天结束时间
     *
     * @return
     * @throws ParseException
     */
    public static Date getTodayEndTime() throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return datetimeFormat.parse(format.format(new Date()) + " 23:59:59");
    }

    /** 返回今天的日期，带时分秒 */
    public static Date currentDateTime() {
        return new Date();
    }

    /**
     * 格式化日期
     *
     * @param date
     * @param formatString
     * @return
     */
    public static String format(Date date, String formatString) {
        if (date == null) {
            return null;
        } else {
            SimpleDateFormat df = new SimpleDateFormat(formatString);
            return df.format(date);
        }
    }

    public static Date addDay(Date date, int amount) {
        Calendar cal = calendar();
        cal.setTime(date);
        cal.add(Calendar.DATE, amount);
        return cal.getTime();
    }

    public static Date addMonths(Date lenderDate, int intValueExact) {
        Calendar cal = calendar();
        cal.setTime(lenderDate);
        cal.add(Calendar.MONTH, intValueExact);
        return cal.getTime();
    }

    public static Date addYear(Date lenderDate, int intValueExact) {
        Calendar cal = calendar();
        cal.setTime(lenderDate);
        cal.add(Calendar.YEAR, intValueExact);
        return cal.getTime();
    }

    public static Calendar calendar() {
        Calendar cal = GregorianCalendar.getInstance(Locale.CHINESE);
        cal.setFirstDayOfWeek(2);
        return cal;
    }

    public static boolean isEqual(Date date1, Date date2) {
        return date1.compareTo(date2) == 0;
    }

    public static Date today() {
        return new Date();
    }

    public static long getDateSubDays(Date date1, Date date2) {
        long d1 = date1.getTime();
        long d2 = date2.getTime();
        long diff = 0L;
        if (d1 == d2)
            return diff;
        if (d1 > d2)
            diff = d1 - d2;
        else {
            diff = d2 - d1;
        }
        return diff / daytimes;
    }

    /**
     * ifNowBetweenTwoDate:判断当前时间是否在传参的开始和结束时间之间. <br/>
     *
     * @author owen.wang
     * @param startDate
     * @param endDate
     * @return
     */
    public static boolean ifNowBetweenTwoDate(Date startDate, Date endDate) {
        if (startDate == null || endDate == null) {
            return true;
        }
        Date nowDate = new Date();
        if (nowDate.compareTo(startDate) >= 0 && nowDate.compareTo(endDate) <= 0) {
            return true;
        }
        return false;
    }

    /**
     * dateToString:按指定格式化时间数据. <br/>
     *
     * @author Owen.Wang
     * @param date
     *            传输的时间数据
     * @param pattern
     *            格式化格式
     * @return
     * @throws ParseException
     */
    public static String dateToString(Date date, String pattern) {
        if (null == date) {
            return null;
        }
        SimpleDateFormat sf = new SimpleDateFormat(pattern);
        return sf.format(date);
    }

    /**
     *
     * getTime:TODO. 获得当天时间<br/>
     *
     * @author Len.Song
     * @param parrten
     *            输出的时间格式
     * @return
     */
    public static String getTime(String parrten) {
        String timestr;
        if (parrten == null || parrten.equals("")) {
            parrten = "yyyy-MM-dd";
        }
        SimpleDateFormat sdf = new SimpleDateFormat(parrten);
        Date cday = new Date();
        timestr = sdf.format(cday);
        return timestr;
    }

    public static String getCurrentTime(){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
        Date date=new Date();
        String current=sdf.format(date);
        return current;
    }

    /**
     *  计算年限
     *  返回String类型时间
     */
    public static String getLimitTime(int year){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar calendar=Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.YEAR,year);
        Date date=calendar.getTime();
        String StringDate=sdf.format(date);
        return StringDate;
    }

    /**
     * 计算天数
     */
    public static String getDateTime(Integer day){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar calendar =Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.DATE, day);
        Date date=calendar.getTime();
        String current=sdf.format(date);
        return current;
    }

    /**
     * 计算当前是星期几
     */
    public static String getCurrentWeek(){
        final String datNames[]={ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        Calendar calendar=Calendar.getInstance();
        Date date=new Date();
        calendar.setTime(date);
        int dayOfWeek=calendar.get(Calendar.DAY_OF_WEEK)-1;
        if (dayOfWeek<0){
            dayOfWeek=0;
        }
        return datNames[dayOfWeek];
    }

    /**
     * 获取当天的某个时间
     */
    public static Date getDate(int hour, int minute){
        Calendar calendar=Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY,hour);
        calendar.set(Calendar.MINUTE,minute);
        return calendar.getTime();
    }

    /**
     * 计算缺勤时长
     */
    public static int getMinute(Date startTime, Date endTime){
        int minute;
        long start = startTime.getTime();
        long end = endTime.getTime();
        if (start>=end){
            minute=0;
        }else {
            minute = (int) ((end-start)/(1000*60));
        }
        return minute;
    }

    /**
     * 计算当天日期
     */
    public static String getCurrentDay(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String currentDay=sdf.format(date);
        return currentDay;
    }

    public static int getWorkHours(Date startTime, Date endTime){
        if (startTime!=null&&endTime!=null){
            long start=startTime.getTime();
            long end=endTime.getTime();
            int dd= (int) ((end-start)/1000/60/60);
            return dd;
        }else {
            return 0;
        }
    }
}
