package com.stone.support.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * @author rong
 * 
 */
public abstract class DateFormatTool {

    private static SimpleDateFormat sdf = new SimpleDateFormat("",
            Locale.SIMPLIFIED_CHINESE);

    /**
     * 普通格式:yyyy-MM-dd hh:mm:ss
     */
    public static String COMMONDATE = "yyyy-MM-dd HH:mm:ss";

    /**
     * 格式yyyyMMdd HH:mm:ss
     */
    public static String NONEDATE = "yyyyMMdd HH:mm:ss";

    /**
     * 无时间的格式yyyy-MM-dd
     */
    public static String NOTIME = "yyyy-MM-dd";

    /**
     * 日期格式转换成字符串
     * 
     * @param date
     * @param formatStr
     * @return String
     */
    public static String formate(Date date, String formatStr) {
        if (date == null)
            return "";
        return new SimpleDateFormat(formatStr).format(date);
    }

    /**
     * 传回格式yyyyMMdd HH:mm:ss或者yyyyMMdd格式的日期字符串
     * 
     * @param dt_in
     * @param bShowTimePart_in
     * @return
     */
    public static String format(Date date, boolean bShowTimePart) {
        if (bShowTimePart) {
            return (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(date);
        } else {
            return (new SimpleDateFormat("yyyy-MM-dd")).format(date);
        }
    }
 
    public static String formattime(Date date) {

        if (date == null)
            return "";
        return (new SimpleDateFormat("HH:mm")).format(date);

    }

    /**
     * 传回格式yyyyMMdd HH:mm:ss或者yyyyMMdd格式的日期字符串
     * 
     * @param dt_in
     * @param bShowTimePart_in
     * @return
     */
    public static String formatBirth(Date date) {

        return (new SimpleDateFormat(NOTIME)).format(date);

    }

    /**
     * 返回格式化的日期yyyyMMdd HH:mm:ss或者yyyyMMdd
     * 
     * @param date
     * @param bShowTimePart_in
     * @return
     */
    public static Date dateFormatDate(Date date, boolean bShowTimePart) {
        Date res = null;
        try {
        	
        	 if (bShowTimePart) {
                String temp = new SimpleDateFormat("yyyy-MM-dd HH:mm")
                        .format(date);
                res = formatToDate(temp,true);
            } else {
                String temp = new SimpleDateFormat("yyyy-MM-dd").format(date);
                res = formatToDate(temp,false);
            }
        } catch (Exception e) {
        }
        return res;
    }
    
    /**
     * 返回格式化的日期yyyyMMdd HH:mm:ss或者yyyyMMdd
     * 
     * @param date
     * @param bShowTimePart_in
     * @return
     */
    public static Date dateFormatDate(Date date, String datetype) {
        Date res = null;
        try {
    
                String temp = new SimpleDateFormat(datetype)
                        .format(date);
                res = (new SimpleDateFormat(datetype)).parse(temp);
    
        } catch (Exception e) {
        	
        }
        return res;
    }  

    /**
     * 输入字符串返回日期类型
     * 
     * @param parDate
     * @param bShowTimePart
     * @return Date
     */
    public static Date formatToDate(String parDate, boolean bShowTimePart) {
        if (parDate == null || parDate.equals("")) {
            return null;
        }
        Date res = null;
        try {
            if (bShowTimePart) {

                res = (new SimpleDateFormat("yyyy-MM-dd HH:mm"))
                        .parse(parDate);

            } else {

                res = (new SimpleDateFormat("yyyy-MM-dd")).parse(parDate);

            }
        } catch (ParseException e) {
        }
        return res;
    }
    
    /**
     * 输入字符串返回日期类型
     * 
     * @param parDate
     * @param bShowTimePart
     * @return Date
     */
    public static Date formatToDate(String parDate, String bShowTimePart) {
        if (parDate == null || parDate.equals("")) {
            return null;
        }
        Date res = null;
        try {
            if (StringUtils.isNullOrBlank(bShowTimePart)) {

                res = (new SimpleDateFormat("yyyy-MM-dd HH:mm"))
                        .parse(parDate);

            } else {

                res = (new SimpleDateFormat(bShowTimePart)).parse(parDate);

            }
        } catch (ParseException e) {
        }
        return res;
    }

    /**
     * 输入字符串返回日期类型
     * 
     * @param parDate
     * @param bShowTimePart
     * @return Date
     */
    public static Date formatTimeToDate(String parDate) {
        if (parDate == null || parDate.equals("")) {
            return null;
        }
        Date res = null;
        try {

            res = (new SimpleDateFormat("yyyy-MM-dd HH:mm"))
                    .parse("2009-01-01 " + parDate);

        } catch (ParseException e) {
        }
        return res;
    }

    /**
     * 除去日期中的"-", 把YYYY-MM-DD转换为YYYYMMDD（String类型）
     * 
     * @param dt 格式为YYY-MM-DD的字符串
     * @return String 格式为YYYMMDD的字符串
     */
    public static String trimDate(String dt) {
        String retDt = "";
        try {
            if (null == dt || dt.length() == 0)
                return "";
            else
                retDt = dt.substring(0, 4) + dt.substring(5, 7)
                        + dt.substring(8, 10);
            return retDt;
        } catch (Exception e) {
            return "";
        }
    }

    /**
     * 获取yyyymmdd格式的日期字符串
     * 
     * @param d
     * @return
     */
    public static final String getDateYYYYMMDD(Date d) {
        sdf.applyPattern("yyyyMMdd");
        return sdf.format(d);
    }
    
	/**
	 * 日期追加天数
	 * 
	 */
	public static Date addDate(final Date date, final int days) {
		Date dt = null;
		try {
			long   time   =  date.getTime(); 
			time = time + (24*60*60*1000) * days;//加 24(hour)*60(minutes)*60(seconds)*1000(millisecond),一天时间 
			dt = new Date(time); 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return dt;
		}
	}
	//字符串转换成Date
	public static Date formatStringToDate(String date,String format){
		SimpleDateFormat f = new SimpleDateFormat(format);
		Date d = null;
		try {
			d = f.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

}
