package com.bakery.application.filter;
import com.bakery.application.entity.VisitCountCriteria;
import com.bakery.application.service.VisitCountService;
import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author liting
 * @date 2019-04-08  18:38
 */
@WebFilter(urlPatterns = {"/login"})
public class CountFilter implements Filter {
    @Autowired
    VisitCountService visitCountService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //强转
        HttpServletRequest request=(HttpServletRequest)servletRequest;
        HttpServletResponse  response=(HttpServletResponse) servletResponse;
        //获取application 域
        ServletContext application=request.getServletContext();
        Object num=application.getAttribute("num");
        if(num==null){
            //查询数据库：1.如果数据库num=0，set num=1;2.如果数据库num!=0,set num=DBnum;
            int count = visitCountService.selectByExample(new VisitCountCriteria()).get(0).getVisitcount();
            if(count==0){
                application.setAttribute("num",1);
            }else{
                application.setAttribute("num",count+1);
            }
        }else{
            int temp=(Integer)num;
            temp++;
            application.setAttribute("num",temp);
            System.out.println(temp+"num");
        }
        //放行
        filterChain.doFilter(request,response);
    }
    @Override
    public void destroy() {

    }
}

