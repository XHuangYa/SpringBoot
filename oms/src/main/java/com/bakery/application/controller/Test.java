/*package com.bakery.application.controller;

import com.bakery.application.constant.Url;
import com.bakery.application.constant.Views;
import com.bakery.application.entity.Employee;
import com.bakery.application.util.HttpClientUtil;
import com.bakery.application.util.JsonUtil;
import com.bakery.application.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
public class Test {
    //用户名
    private static String Uid = "XHuangYa";

    //接口安全秘钥
    //private static String Key = "d41d8cd98f00b204e980";
    private static String Key = "d41d8cd9843243214";
    //手机号码，多个号码如13800000000,13800000001,13800000002
    private static String smsMob = "18341836189";
    //短信内容
    private static String smsText = "验证码：8888";
    //文件上传
    @RequestMapping("/uploadFile")
    public void  uploadFile(MultipartFile bigHeadImg) throws IOException {
        //获取源文件名
        String originalFilename = bigHeadImg.getOriginalFilename();
        //获取控件的name属性名
        //String fileName = bigHeadImg.getName();
        //获取文件上传的后缀名
        String exet=originalFilename.substring(originalFilename.lastIndexOf("."));
        String uuid= UUIDUtil.create32Key();
        //动态创建文件路径（以时间命名）
        Date date=new Date();
        SimpleDateFormat sdf =new SimpleDateFormat("yyyyMMdd/HH/mm/ss");
        String dir="/Users/liting/文档/upload/"+sdf.format(date);
        File fileDir =new File(dir);
        //判断文件是否存在
        if(!fileDir.exists()){
            fileDir.mkdirs();
        }
        String saveFilePath=fileDir+"/"+uuid+exet;
        File file=new File(saveFilePath);
        bigHeadImg.transferTo(file);

    }









    @RequestMapping(Url.PDT_MANAGER_LIST)
    public String getPdt(){
        System.out.println("pdt");
        return Views.PDT_LIST_VIEW;
    }
       @RequestMapping(Url.ORDER_MANAGE_LIST)
    public String getOrder(){
        System.out.println("order");
        return Views.ORDER_LIST_VIEW;
    }
    @RequestMapping(Url.STOCK_MANAGE_LIST)
    public String getStock(){
        System.out.println("order");
        return Views.STOCK_LIST_VIEW;
    }
    @RequestMapping(Url.STORE_IN_LIST)
    public String getIn(){
        System.out.println("order");
        return Views.STORE_IN_VIEW;
    }
    @RequestMapping(Url.STORE_OUT_LIST)
    public String getOut(){
        System.out.println("order");
        return Views.STORE_OUT_VIEW;
    }



    @RequestMapping("/number")
    public @ResponseBody String  getNum(String phone, HttpServletRequest request){
        smsText= HttpClientUtil.getRandomCode();
        int result= HttpClientUtil.send(Uid,Key,phone,smsText);
        HttpSession session = request.getSession();
        session.setAttribute("smsText", smsText);
        session.setMaxInactiveInterval(60 * 1);
        System.out.println(smsText+"============");
        return HttpClientUtil.getMessage(result);
    }
    @ResponseBody
    @RequestMapping("/registh")
    public ModelMap regist(String phone, String number,ModelMap model, HttpServletRequest request){
        //从session中比对发送的验证码
        HttpSession session = request.getSession();//设置session
        String sessioncode =(String) session.getAttribute("smsText");
        System.out.println(sessioncode+"----num"+number);
        return model;
    }


    public static void main(String[] args) {
        //生成随机数
        String sms=String.valueOf(Math.random()*1000000);
        String smsText=sms.substring(0,6);
        int result=HttpClientUtil.send("XHuangYa","d41d8cd98f00b204e980","18341836189","+smsText);
        if(result>0){
            System.out.println("UTF8成功发送条数=="+result+"--"+smsText);
        }else{
            System.out.println(HttpClientUtil.getMessage(result));
        }
        System.out.println(smsText);





    }
}
*/