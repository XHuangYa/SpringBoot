package com.bakery.application.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;


public class DateUtil {
	/**
	* 判断指定的时间是否在给定的范围内
	 * @param specifiedDate
	 * @param startDate
	 * @param endDate
	 * @return 在给定的时间范围内true，包含开始时间和结束时间
	 * @throws IllegalArgumentException  如果startDate > endDate，抛出IllegalArgumentException
	 */
	public static boolean between(Date specifiedDate,Date startDate,Date endDate) throws IllegalArgumentException{
		if(startDate.compareTo(endDate) >0 ){
			throw new IllegalArgumentException("startDate晚于endDate");
		}
			
		boolean result = true;
		int startInt = specifiedDate.compareTo(startDate);
		if(startInt < 0){
			result = false;
		}
		int endInt = specifiedDate.compareTo(endDate);
		if(endInt > 0){
			result = false;
		}
		return result;
	}
	
	/**
	 * 校验出生日期
	 * @param time
	 * @return
	 * @throws ParseException
	 */
	public static Date parseBirth(String time) throws ParseException{
		if(StringUtils.isBlank(time)){
			return null;
		}else if("0".equals(time.substring(0,1))){
			return null;
		}
		String[] parsePatterns = {"yyyy-MM-dd","yyyy-M-d","yyyy-M-dd","yyyy-MM-d","yyyyMMdd"};
		return parseDate(time, parsePatterns);
	}
	
	/**
	 * 
	 * @param time
	 * @return
	 * @throws ParseException
	 */
	public static Date parse(String time) throws ParseException{
		if(StringUtils.isBlank(time)){
			return null;
		}
		String[] parsePatterns = {"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss","yyyy-MM-dd HH:mm:ss.S","yyyy-MM-dd HH/mm/ss.S","yyyy-MM-dd HH:mm","yyyyMMddHHmmss","yyyyMMdd"};
		return parseDate(time, parsePatterns);
	}
	
	/**
	 * 保险起期的规则校验：是否在前后一年的范围内
	 * add by gxy,2010-07-16
	 * @param insurStartDate
	 * @return
	 */
	public static boolean validateInsurStartDate(String insurStartDate){
		boolean rtn = true;
		
		//SimpleDateFormat fmt1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd"); 
		Date bdt = null;
		try{
			bdt = fmt.parse(insurStartDate);
		}catch(Exception e){
			e.printStackTrace();
		}
		Date date = new Date();
        Calendar cal = Calendar.getInstance();
        long a = date.getTime()-31536000000L;
		cal.setTimeInMillis(a);
        String preStart = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
		Date preDate = null;
		try {
			preDate = fmt.parse(preStart);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long b = date.getTime()+31622400000L;
		cal.setTimeInMillis(b);
		String aftStart = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
		Date aftDate = null;
		try {
			aftDate = fmt.parse(aftStart);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if(bdt.before(preDate)||bdt.after(aftDate)){
			rtn = false;
		}
		return rtn;
	}
	
	/**
	 * //实际降落时间和计划降落时间比较
	 * @param
	 * @return
	 */
	public static int perfectFlightArrtime(String flightArrtimeReadyStr,String flightArrtimeStr){
		
		String[] Num1 = flightArrtimeStr.split(":");
		String[] Num2 = flightArrtimeReadyStr.split(":");
		int k = 0;
		k = (Integer.parseInt(Num1[0])-Integer.parseInt(Num2[0]))*60 +(Integer.parseInt(Num1[1])-Integer.parseInt(Num2[1])); 
		if(k<-180){
			k=k+24*60;
		}else if(k>21*60){
			k=k-24*60;
		}
	
		return k;
	}

	/**
	 * //求航班已计划降落天数
	 * @param
	 * @return
	 * @throws ParseException 
	 */
	public static int compareCurdate(String flightDate) throws ParseException {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");         
		Date date1 = format.parse(flightDate);
        Date date2 = new Date(); 
        long diff = date2.getTime() - date1.getTime();
        if(diff<0)diff=0;
        int days = (int) (diff/(1000*60*60*24));
		return days;
	}

	
	public static Date parseDate(String str, String[] parsePatterns) throws ParseException {  
		if (str == null || parsePatterns == null) {
            throw new IllegalArgumentException("Date and Patterns must not be null");
        }
        
        SimpleDateFormat parser = null;
        ParsePosition pos = new ParsePosition(0);
        for (int i = 0; i < parsePatterns.length; i++) {
            if (i == 0) {
                parser = new SimpleDateFormat(parsePatterns[0]);
                parser.setLenient(false);
            } else {
                parser.applyPattern(parsePatterns[i]);
            }
            pos.setIndex(0);
            Date date = parser.parse(str, pos);
            if (date != null && pos.getIndex() == str.length()) {
                return date;
            }
        }
        throw new ParseException("Unable to parse the date: " + str, -1);
	}
	
	/**
	 * 
	 * @param
	 * @return
	 * @throws ParseException 
	 */
	public static String longToTime(Long delayTime) {  
		int ss = 1000;
		int mi = ss * 60;
		int hh = mi * 60;
		int dd = hh * 24;

		long day = delayTime / dd;
		long hour = (delayTime - day * dd) / hh;
		long minute = (delayTime - day * dd - hour * hh) / mi;
		long second = (delayTime - day * dd - hour * hh - minute * mi) / ss;
		long milliSecond = delayTime - day * dd - hour * hh - minute * mi - second * ss;

		   String strDay = day < 10 ? "0" + day : "" + day;
		String strHour = hour < 10 ? "0" + hour : "" + hour;
		String strMinute = minute < 10 ? "0" + minute : "" + minute;
		String strSecond = second < 10 ? "0" + second : "" + second;
		String strMilliSecond = milliSecond < 10 ? "0" + milliSecond : "" + milliSecond;
		strMilliSecond = milliSecond < 100 ? "0" + strMilliSecond : "" + strMilliSecond;
		return strHour + ":" + strMinute + ":" + strSecond;  
	}

	//将淘宝的预计降落时间转换成时分格式返回
	public static String getMS(Date airArriTime) {
		int min = 0;//默认时
		int sec = 0;//默认秒
		min =airArriTime.getHours();
		sec = airArriTime.getMinutes();
		String str = min+":"+sec;
		return str;
	}
	
	/**
	 * 根据给定的时间，返回该时间所在那天的最初时间
	 * @param specifiedTime
	 * @return
	 */
	public static Date getFirstTimeOfDay(Date specifiedTime){
		Calendar cal = Calendar.getInstance();
		cal.setTime(specifiedTime);
		
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		
		return cal.getTime();
	}
	
	/**
	 * 根据给定的时间，返回该时间所在那天的最后时间
	 * @param specifiedTime
	 * @return
	 */
	public static Date getLastTimeOfDay(Date specifiedTime){
		Calendar cal = Calendar.getInstance();
		cal.setTime(specifiedTime);
		
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		
		return cal.getTime();
	}
	/**
	 * 向前或向后计算N天，如果N为正数则向前移，如果N为负数则往后移动
	 * @param date
	 * @param moveNum
	 * @return
	 */
	public static Date getPreOrAftDay(Date date,int moveNum){
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_MONTH, moveNum);
		
		return cal.getTime();
	}
	
	 /**
	  * 转换时间格式
	  * @param dateString  表示时间的字符串
	  * @param oldPattern  旧的格式
	  * @param newPattern  新的格式
	  * @return
	  */
	 public static String convertDateString(String dateString,String oldPattern,String newPattern){
		 try {
			Date date = DateUtil.parseDate(dateString, new String[]{oldPattern});
			return DateFormatUtils.format(date, newPattern);
		} catch (ParseException e) {
			return null;
		}
	 }
	
}

