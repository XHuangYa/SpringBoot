/*
package com.bakery.application.controller;

import com.bakery.application.entity.QQ;
import org.springframework.boot.context.properties.bind.BindResult;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

*/
/**
 * @author liting
 * @date 2019-04-09  11:32
 *//*

public class FrontConroller {
    */
/**
     * qq：封装表单传递过来的数据
     * br:只封装错误信息
     *//*

    public String qqRegister(@Valid QQ qq, BindingResult br, Map<String,Object> map){
       //判断qq中的数据是否 格式正确
        boolean flag=br.hasErrors();
        if(flag){//数据格式有误
            //一个FieldError对象中封装2个信息：（1）发生错误的字段名（2）message信息
            //name="姓名格式错误"
            List<FieldError> fieldErrorList=br.getFieldErrors();
            //定义一个map集合用来封装所有错误字段的错误信息
            Map<String,Object> errorMessageMap=new HashMap<String,Object> ();
            for(FieldError fieldError:fieldErrorList){
                //取出发生错误的字段名
                String fileName=fieldError.getField();
                //取出字段名上的message错误信息
                String message=fieldError.getDefaultMessage();
                errorMessageMap.put(fileName,message);
            }
            //只存取错误信息
            map.put("errorMeaageMap",errorMessageMap);
            //存放缓存缓存信息，显示在页面(回写)
            map.put("qq",qq);
            return "login";
        }else{//数据格式正确调用业务层
            return "success";
        }
    }
}
*/
