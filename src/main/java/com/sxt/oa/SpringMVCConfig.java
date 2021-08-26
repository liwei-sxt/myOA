package com.sxt.oa;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.BeanNameViewResolver;
import org.springframework.web.servlet.view.InternalResourceView;


@Configuration
@EnableWebMvc/*注解驱动*/
@ComponentScan(basePackages = "com.sxt.oa.controller")
public class SpringMVCConfig implements WebMvcConfigurer {

    /*单独解析index页面路径*/
    @Bean
    public InternalResourceView login(){
        InternalResourceView internalResourceView=new InternalResourceView();
        internalResourceView.setUrl("/index.jsp");
        return internalResourceView;
    }
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        /*单独解析index页面路径*/
        BeanNameViewResolver beanNameViewResolver=new BeanNameViewResolver();
        beanNameViewResolver.setOrder(3);
        registry.viewResolver(beanNameViewResolver);

        registry.jsp("/WEB-INF/",".jsp");
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/top").setViewName("top");
        registry.addViewController("/left").setViewName("left");
        registry.addViewController("/mainfrm").setViewName("mainFrm");
        registry.addViewController("/main").setViewName("main");
        registry.addViewController("/unauth").setViewName("unauth");
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
}
