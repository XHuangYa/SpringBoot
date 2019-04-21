package com.bakery.application.tasks;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author liting
 * @date 2019-04-10  17:53
 */
@Component
public class RmvOutDateTask {
    //按照固定的时间执行
    //@Scheduled(fixedRate = 1000)
    //在固定的时间执行cron="* * * * * *"<==>秒 分 时 天 月 周 [年]
    //0/3每隔三秒执行一次
    @Scheduled(cron ="0/3 12 18 * * *" )
   public void Test(){
       Date date=new Date();
       SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       sdf.format(date);
       System.out.println(  sdf.format(date));
   }
}
