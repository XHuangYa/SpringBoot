package com.bakery.application.controller;

import com.bakery.application.constant.Url;
import com.bakery.application.constant.Views;
import com.bakery.application.entity.person;
import com.bakery.application.service.PersonService;
import com.bakery.application.util.HttpClientUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

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

    @Autowired
    PersonService personService;
    @RequestMapping("/show")
    public @ResponseBody
    List<person> select(){
        return personService.select();
    }

    @RequestMapping("/add")
    public int add(person person){
       int num=personService.addUsers(person);
       return num;

    }

    @RequestMapping(Url.EMP_MANAGER_LIST)
    public String get(){
        return Views.EMP_LIST_VIEW;
    }


    @RequestMapping(Url.USER_MANAGER_LIST)
    public String getUser(){
        System.out.println("iuser");
        return Views.USER_LIST_VIEW;
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
    @RequestMapping("/regist")
    public ModelMap regist(String phone, String number,ModelMap model, HttpServletRequest request){
        //从session中比对发送的验证码
        HttpSession session = request.getSession();//设置session
        String sessioncode =(String) session.getAttribute("smsText");
        System.out.println(sessioncode+"----num"+number);
        return model;
    }


    public static void main(String[] args) {
       /* //生成随机数
        String sms=String.valueOf(Math.random()*1000000);
        String smsText=sms.substring(0,6);
        int result=HttpClientUtil.send("XHuangYa","d41d8cd98f00b204e980","18341836189","+smsText);
        if(result>0){
            System.out.println("UTF8成功发送条数=="+result+"--"+smsText);
        }else{
            System.out.println(HttpClientUtil.getMessage(result));
        }
        System.out.println(smsText);

*/



    }
}
