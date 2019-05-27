package com.bakery.application.tasks;

import com.bakery.application.entity.VisitCount;
import com.bakery.application.entity.VisitCountCriteria;
import com.bakery.application.service.VisitCountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.util.Date;

/**
 * @author liting
 * @date 2019/05/27  10:18
 */
@Component
public class SaveCountTask {
    @Autowired
    VisitCountService visitCountService;
    @Autowired
    ServletContext applition;
    //按照固定的时间执行
    //@Scheduled(fixedRate = 1000)
    //在固定的时间执行cron="* * * * * *"<==>秒 分 时 天 月 周 [年]
    //0/3每隔三秒执行一次
    @Scheduled(cron ="0 0 0 * * *")
    public void saveCountToDB() throws Exception {
        /*WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
        ServletContext applition=webApplicationContext.getServletContext();*/
        Object num = applition.getAttribute("num");
        if(num!=null){
            VisitCount visitCount=new VisitCount();
            visitCount.setVisitcount((Integer) num);
            visitCount.setUpdatetime(new Date());
            boolean b = visitCountService.updateByExampleSelective(visitCount, new VisitCountCriteria());
            if(!b){
                throw new Exception("计数统计失败！");
            }
        }

    }
}
