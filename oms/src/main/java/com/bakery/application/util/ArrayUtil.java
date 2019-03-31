package com.bakery.application.util;

public class ArrayUtil {
	/**
	 * 判断数组中的最大数
	 * @param args
	 * @return
	 */
	public static String getMaxNum(String args[]){
		int max=0;
		for(int i=0;i<args.length;i++){
			if(args[i] != null) {
				if(args[i].compareTo(args[max])>=0)
					max=i;
			}
		}
		return args[max];
	}
	/**
	 * 判断数组中的最小数
	 * @param args
	 * @return
	 */
	public static String getMinNum(String args[]){
		int min=0;
		for(int i=0;i<args.length;i++){
			if(args[i] != null) {
				if(args[i].compareTo(args[min])<=0)
					min=i;
			}
		}
		return args[min];
	}
	
	/**
	 * 向数组中插入值
	 * @param args
	 * @return
	 */
	public static String[] insert(String[] arr, String str)    {
		int size = arr.length; 
		String[] tmp = new String[size + 1]; 
		System.arraycopy(arr, 0, tmp, 0, size); 
		tmp[size] = str;
		return tmp; 
	}
}
