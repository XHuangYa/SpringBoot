package com.bakery.application.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author liting
 * @date 2019/04/06  12:03
 */
@Configuration
public class MVCConfig implements WebMvcConfigurer {
    //注册视图控制器
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("oms").setViewName("login");
    }
    //注册拦截器
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(new Interceptor())
//                .addPathPatterns("/**")
//                .excludePathPatterns("/oms","/**/*.css","/**/*.js","/**/*.png","/**/*.jpg","/**/*.jpeg");
//                 WebMvcConfigurer.super.addInterceptors(registry);
//              }


}
