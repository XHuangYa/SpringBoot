package com.bakery.application.util;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

//类能将几乎所有类型转换成JSON形式的字符串

public class JsonUtil {
	private static Log log = LogFactory.getLog(JsonUtil.class);
	
	public static String objecttojson(Object obj) {
	         StringBuilder json = new StringBuilder();
	         if (obj == null || obj.toString().equals("")) {
	           json.append("\"\"");
	         } else if (obj instanceof String || obj instanceof Integer || obj instanceof Float
	             || obj instanceof Boolean || obj instanceof Short || obj instanceof Double
	             || obj instanceof Long || obj instanceof BigDecimal || obj instanceof BigInteger || obj instanceof Date 
	             || obj instanceof Byte) {
	           json.append("\"").append(stringtojson(obj.toString())).append("\"");
	             } else if (obj instanceof Object[]) {
	               json.append(arraytojson((Object[]) obj));
	             } else if (obj instanceof List) {
	               json.append(listtojson((List<?>) obj));
	             } else if (obj instanceof Map) {
	               json.append(maptojson((Map<?, ?>) obj));
	             }  else {
	               json.append(beantojson(obj));
	             }
	             return json.toString();
	  }
	
	public static String beantojson(Object bean) {
	         StringBuilder json = new StringBuilder();
	         json.append("{");
	         PropertyDescriptor[] props = null;
	         try {
	           props = Introspector.getBeanInfo(bean.getClass(), Object.class).getPropertyDescriptors();
	         } catch (IntrospectionException e) {}
	         if (props != null) {
	           for (int i = 0; i < props.length; i++) {
	             try {
	               String name = objecttojson(props[i].getName());
	               String value = objecttojson(props[i].getReadMethod().invoke(bean));
	               json.append(name);
	               json.append(":");
	               json.append(value);
	               json.append(",");
	             } catch (Exception e) {}
	           }
	           json.setCharAt(json.length() - 1, '}');
	         } else {
	           json.append("}");
	             }
	             return json.toString();
	  }
	
	public static String listtojson(List<?> list) {
             StringBuilder json = new StringBuilder();
             json.append("[");
             if (list != null && list.size() > 0) {
               for (Object obj : list) {
                 json.append(objecttojson(obj));
                 json.append(",");
               }
               json.setCharAt(json.length() - 1, ']');
             } else {
               json.append("]");
             }
             return json.toString();
	  }
	
	public static String arraytojson(Object[] array) {
	             StringBuilder json = new StringBuilder();
	             json.append("[");
	             if (array != null && array.length > 0) {
	               for (Object obj : array) {
	                 json.append(objecttojson(obj));
	                 json.append(",");
	               }
	               json.setCharAt(json.length() - 1, ']');
	             } else {
	               json.append("]");
	             }
	             return json.toString();
	  }
	
	public static String maptojson(Map<?, ?> map) {
	             StringBuilder json = new StringBuilder();
	             json.append("{");
	             if (map != null && map.size() > 0) {
	               for (Object key : map.keySet()) {
	                 json.append(objecttojson(key));
	                 json.append(":");
	                 json.append(objecttojson(map.get(key)));
	                 json.append(",");
	               }
	               json.setCharAt(json.length() - 1, '}');
	             } else {
	               json.append("}");
	             }
	             return json.toString();
	  }
	
	
	
	public static String stringtojson(String s) {
	             if (s == null)
	               return "";
	             StringBuilder sb = new StringBuilder();
	             for (int i = 0; i < s.length(); i++) {
	               char ch = s.charAt(i);
	               switch (ch) {
	               case '"':
	                 sb.append("\\\"");
	                 break;
	               case '\\':
	                 sb.append("\\\\");
	                 break;
	               case '\b':
	                 sb.append("\\b");
	                 break;
	               case '\f':
	                 sb.append("\\f");
	                 break;
	               case '\n':
	                 sb.append("\\n");
	                 break;
	               case '\r':
	                 sb.append("\\r");
	                 break;
	               case '\t':
	                 sb.append("\\t");
	                 break;
	               case '/':
	                 sb.append("\\/");
	                 break;
	               default:
	                 if (ch >= '\u0000' && ch <= '\u001F') {
	                   String ss = Integer.toHexString(ch);
	                   sb.append("\\u");
	                   for (int k = 0; k < 4 - ss.length(); k++) {
	                     sb.append('0');
	                   }
	                   sb.append(ss.toUpperCase());
	                 } else {
	                   sb.append(ch);
	                 }
	               }
	             }
	             return sb.toString();
	  }
	
}




