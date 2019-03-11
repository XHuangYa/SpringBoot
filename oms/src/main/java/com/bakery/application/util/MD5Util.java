package com.bakery.application.util;

import java.security.MessageDigest;

/**
 * @author liting
 * @date 2019/02/24  21:47
 */
public class MD5Util {
    private static final String[] digital={"0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"};

    private static String initMD5(String txt) throws Exception {
        //创建MD5的核心类对象
        MessageDigest md5=MessageDigest.getInstance("MD5");
        //将明文进行加密
        //String txt="123";
        //将明文转为字符串数组
        byte[] bytes=md5.digest(txt.getBytes("UTF-8"));
        //定义一个空字符串用来接收最终的秘文
        String enctry="";
        for (byte b : bytes) {//会循环16次
            //每次循环的时候需要从gidital中循环取出2个不同字符，随机算出0～15的两个下标
            int item=b;
            if(item<0){
                item=item+256;
            }
            //第一个下标
            int i=item/16;
            //第二个下标
            int j=item%16;
            enctry+=digital[i]+digital[j];
        }
        return  enctry;
    }

    public static String finishMD5(String txt) throws Exception {
        String string=initMD5(initMD5(txt)+"密码");
        return string;

    }
}
