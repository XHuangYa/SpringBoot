package com.bakery.application.filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author liting
 * @date 2019-04-08  18:38
 */
public class CountFilter implements Filter {
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
            application.setAttribute("num",1);
        }else{
            int temp=(Integer)num;
            temp++;
            application.setAttribute("num",temp);
        }
        //放行
        filterChain.doFilter(request,response);
    }
    @Override
    public void destroy() {

    }
}

