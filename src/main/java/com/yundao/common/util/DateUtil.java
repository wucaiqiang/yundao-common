package com.yundao.common.util;

import com.yundao.core.exception.BaseException;
import com.yundao.core.log.Log;
import com.yundao.core.log.LogFactory;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * Created by gjl on 2017/8/16.
 */
public class DateUtil {

    private static Log log = LogFactory.getLog(DateUtil.class);


    /**
     * 把日期往后增加天.整数往后推,负数往前移动
     *
     * @param date
     * @param day
     */
    public static Date addDay(Date date, Integer day) {
        return addTime(date, Calendar.DATE, day);
    }

    /**
     * 从当前时间增加分钟数
     *
     * @param amount 需要增加的分钟数
     */
    public static Date addMinute(Integer amount) {
        return addTime(new Date(), Calendar.MINUTE, amount);
    }

    private static Date addTime(Date date, int field, Integer amount) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        calendar.add(field, amount);
        return calendar.getTime();
    }

    public static boolean isExpire(Date date) throws BaseException {
        if (null == date) {
            log.info("租户合同过期时间为空");
            return false;
        }
        try {
            String formatDate = com.yundao.core.utils.DateUtils.getDateEnd(date);
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date newDate = df.parse(formatDate);
            return newDate.before(new Date());
        } catch (Exception ex) {
            log.error("DateUtils.isExpire 异常：%s", ex.toString());
        }
        return false;
    }
}
