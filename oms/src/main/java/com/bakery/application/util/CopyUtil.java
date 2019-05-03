package com.bakery.application.util;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;

public class CopyUtil {
	 public static void Copy(Object source, Object dest)throws Exception {  
		    //从source对象复制到 dest对象
	        BeanInfo sourceBean = Introspector.getBeanInfo(source.getClass(), java.lang.Object.class);  
	        PropertyDescriptor[] sourceProperty = sourceBean.getPropertyDescriptors();  
	          
	        BeanInfo destBean = Introspector.getBeanInfo(dest.getClass(), java.lang.Object.class);  
	        PropertyDescriptor[] destProperty = destBean.getPropertyDescriptors();  
	          
	        try{  
	            for(int i=0;i<sourceProperty.length;i++){  
	                  
	                for(int j=0;j<destProperty.length;j++){  
	                      
	                    if(sourceProperty[i].getName().equals(destProperty[j].getName())){  
	                        //调用source的getter方法和dest的setter方法  
	                        destProperty[j].getWriteMethod().invoke(dest, sourceProperty[i].getReadMethod().invoke(source));  
	                        break;                    
	                    }  
	                }  
	            }  
	        }catch(Exception e){  
	            throw new Exception("复制失败?:"+e.getMessage());  
	        }  
	    }  
}
