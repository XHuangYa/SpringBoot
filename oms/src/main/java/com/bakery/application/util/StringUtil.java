package com.bakery.application.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

public class StringUtil {


	public static boolean isNull(String str){
		boolean re = false;
		if(str==null || "".equals(str.trim())||"null".equalsIgnoreCase(str.trim())){
			re = true;
		}
		return re;
	}

	public static boolean notNull(String str){
		return !isNull(str);
	}

	public static boolean notAllNull(String... strings){
		for(String s:strings){
			if(notNull(s))
				return true;
		}
		return false;
	}

	/**
	 * 将yyyy-mm-dd或者yyyy-mm-dd HH:mm:ss格式的日期字符串转换成yyyy年mm月dd日的格式
	 * @param fromDate
	 * @return 转换后的日期字符串
	 * @throws IllegalArgumentException
	 */
	public static String changeDateFormat(String fromDate) throws IllegalArgumentException{
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date toDate = formatDate.parse(fromDate);
				String date = formatDate.format(toDate);
				String separator = "-";
				StringTokenizer token = new StringTokenizer(date, separator);
				String year = token.nextToken();
				String month = token.nextToken();
				String day = token.nextToken();
				StringBuilder sb = new StringBuilder();
				return sb.append(year).append("年").append(month).append("月").append(day).append("日").toString();
			} catch (ParseException e) {
				throw new IllegalArgumentException("传入的日期不符合转换格式！", e);
			}
	}




	/**
	 * 将yyyy-mm-dd或者yyyy-mm-dd HH:mm:ss格式的日期字符串转换成*年*月*日 HH:mm:ss的格式
	 * @param
	 * @return
	 */
	public static String formatInsurencePeriod(String indate){
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatDate2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String rtnDate = "";
		try {
			Date inTodate = formatDate.parse(indate);
			String date = formatDate.format(inTodate);
			String separator = "-";
			StringTokenizer token = new StringTokenizer(date, separator);
			String year = token.nextToken();
			String month = token.nextToken();
			String day = token.nextToken();
			rtnDate=year+"年"+month+"月"+day+"日";
			try{
				Date inTodate2 = formatDate2.parse(indate);
				String date2 = formatDate2.format(inTodate2);
				rtnDate = rtnDate+ date2.substring(10);
			}catch (Exception e) {
				rtnDate += " 00:00:00";
			}
		} catch (Exception e) {
			System.out.print("formatInsurencePeriod出错");
			e.printStackTrace();
		}finally{
			return rtnDate;
		}
	}
	
	
	
	
	
	/**
	 * 校验字符串长度是否超过限制，汉字长度为2
	 * @param str
	 * @param limitLength
	 * @return 未超过返回true，否则返回false
	 */
	public static boolean isNotOverLength(String str,int limitLength){
		try {
			if(StringUtils.isEmpty(str) || str.getBytes("GBK").length <= limitLength){
				return true;
			}
			return false;
		} catch (UnsupportedEncodingException e) {
			return false;
		}
	}
	
	public static boolean isOverLength(String str,int limitLength){
		return !isNotOverLength(str, limitLength);
	}
	
	/**
	 * 
	 * @param intStr
	 * @return inStr为null、""和空白字符时返回0
	 * @throws NumberFormatException 不能转换为整数时抛出
	 */
	public static int parseInt(String intStr)throws NumberFormatException{
		if(StringUtils.isBlank(intStr)){
			return 0;
		}
		return Integer.parseInt(intStr);
	}
	
	/**
	 * 
	 * @param bigDecimalStr
	 * @return bigDecimalStr为null、""和空白字符时返回null
	 * @throws NumberFormatException
	 */
	public static BigDecimal parseBigDecimal(String bigDecimalStr) throws NumberFormatException{
		if(StringUtils.isBlank(bigDecimalStr)){
			return null;
		}
		return new BigDecimal(bigDecimalStr);
	}
	/**
	 * 验证电话号码是否符合规范
	 * @param
	 * @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>

	 */
	public static boolean  isMobile(String mobileNo) {
		if(StringUtils.isBlank(mobileNo)){
			return true;
		}
		String regex = "^((13[0-9])|(15[0-9])|(18[0-9])|(14[0-9]))\\d{8}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(mobileNo);
		return matcher.matches();
	}
	
	/**
	 * 验证邮箱地址是否符合规范
	 * @param email
	 * @return
	 */
	public static boolean isEmail(String email){
		if(StringUtils.isBlank(email)){
			return true;
		}
//        String regex = "^([a-z0-9A-Z]+[\\w-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		//修改邮箱的校验正则表达式 
		String regex = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
	}
	
	/**
	 * 去掉xml字符串前面的回车换行
	 * @param xmlStr
	 * @return

	 */
	public static String removeLFbeforeXML(String xmlStr){
		
		Pattern p = Pattern.compile("\n<?xml|\r<?xml|\r\n<?xml|\n\r<?xml");
		Matcher m = p.matcher(xmlStr.trim());
		String after = m.replaceAll("<?xml"); 

		return after;
	}

	public static String bigDecimalToFen(BigDecimal bigDecimal){
		BigDecimal unit = new BigDecimal(100);
		BigDecimal fenDecimal = bigDecimal.multiply(unit);
		int fen = fenDecimal.intValue();
		return String.valueOf(fen);
	}
	public static void main(String args[]){
		BigDecimal test = new BigDecimal(28.5);
		System.out.println(bigDecimalToFen(test));
	}
	
	/**
	 * 验证是否是数字
	 * @param str
	 * @return
	 */
  public static boolean isInteger(String str) {  
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");  
        return pattern.matcher(str).matches();  
  }
  
	 public static String getNodeText(byte[] xmlBytes, String nodePath) {
			String rtnStr="";
			InputStream is = null;
			Document doc = null;
			try{
				 is = new ByteArrayInputStream((byte[])xmlBytes); 
				InputStreamReader strInStream = new InputStreamReader(is, "GBK");
				// 解析器
				SAXReader reader = new SAXReader();
				//reader.setEncoding("GBK");
				// 读取并解析文件
				doc = reader.read(strInStream);
				Node node = doc.selectSingleNode(nodePath);
				rtnStr = node.getText();
			} catch(Exception e){
				e.printStackTrace();
			} finally {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			return rtnStr;
		}
	 
	 public static String SMSAuthenticationCode() {
		 int rand = (int)((Math.random()*9+1)*100000);
		 String randomStr = String.valueOf(rand);
		 System.out.println(randomStr);
		
		 return randomStr;
		}
	 
	 /**
		 * 去掉字符串中的空格和回车换行
		 * @param originalStr
		 * @return
		 */
		public static String removeLF(String originalStr){
			return originalStr.trim().replaceAll("\r\n", "").replaceAll("\n\r", "").replaceAll("\r", "").replaceAll("\n", "");
		}}
