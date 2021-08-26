package com.sxt.oa;


import com.sxt.oa.common.AnyRoleFilter;
import com.sxt.oa.common.OARealm;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.mgt.WebSecurityManager;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.servlet.Filter;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
@ComponentScan(basePackages = "com.sxt.oa" , excludeFilters = {@ComponentScan.Filter(type= FilterType.ANNOTATION,classes = Controller.class)})
@MapperScan(basePackages = "com.sxt.oa.data")
@EnableTransactionManagement
public class SpringConfig {

    @Value("${db.url}")
    private String dbUrl;
    @Value("${db.username}")
    private String dbUserName;
    @Value("${db.password}")
    private String dbPassword;
    @Value("${db.driverName}")
    private String dbDriverName;
    @Value("${db.max.active:10}")
    private Integer dbMaxActive;
    @Value("${db.max.idle:2}")
    private Integer dbMaxIdle;

    @Bean
    public static PropertySourcesPlaceholderConfigurer placeholderConfigurer(){
        PropertySourcesPlaceholderConfigurer placeholderConfigurer=new PropertySourcesPlaceholderConfigurer();
        ClassPathResource pathResource=new ClassPathResource("db.properties");
        placeholderConfigurer.setLocation(pathResource);
        placeholderConfigurer.setIgnoreResourceNotFound(true);
        placeholderConfigurer.setIgnoreUnresolvablePlaceholders(true);
        return placeholderConfigurer;
    }

    @Bean(destroyMethod = "close")
    public BasicDataSource basicDataSource(){
        BasicDataSource basicDataSource=new BasicDataSource();
        basicDataSource.setDriverClassName(this.dbDriverName);
        basicDataSource.setUrl(this.dbUrl);
        basicDataSource.setUsername(this.dbUserName);
        basicDataSource.setPassword(this.dbPassword);
        basicDataSource.setMaxActive(this.dbMaxActive);
        basicDataSource.setMaxIdle(this.dbMaxIdle);
        return basicDataSource;
    }

    @Bean(name = "sqlSessionFactory")
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource){
        SqlSessionFactory sessionFactory=null;

        SqlSessionFactoryBean sessionFactoryBean=new SqlSessionFactoryBean();
        sessionFactoryBean.setDataSource(dataSource);
        sessionFactoryBean.setTypeAliasesPackage("com.sxt.oa.domain");

        Resource[] resources=null;
        PathMatchingResourcePatternResolver resourcePatternResolver=new PathMatchingResourcePatternResolver();
        try {
            resources=resourcePatternResolver.getResources("classpath:mapper/*Mapper.xml");
            sessionFactoryBean.setMapperLocations(resources);
        } catch (IOException e) {
            e.printStackTrace();
        }

        org.apache.ibatis.session.Configuration configuration=new org.apache.ibatis.session.Configuration();
        configuration.setMapUnderscoreToCamelCase(true);
        sessionFactoryBean.setConfiguration(configuration);

        try {
            sessionFactory=sessionFactoryBean.getObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sessionFactory;
    }

    @Bean
    public PlatformTransactionManager transactionManager(DataSource dataSource){
        DataSourceTransactionManager transactionManager=new DataSourceTransactionManager();
        transactionManager.setDataSource(dataSource);
        return transactionManager;
    }

    @Bean
    public ShiroFilterFactoryBean shiroFilter(OARealm oaRealm){
        ShiroFilterFactoryBean filterFactoryBean=new ShiroFilterFactoryBean();
        //创建安全管理器
        WebSecurityManager securityManager=new DefaultWebSecurityManager();
        ((DefaultWebSecurityManager) securityManager).setRealm(oaRealm);
        filterFactoryBean.setSecurityManager(securityManager);

        /*过滤器集合*/
        Map<String, Filter> filters=filterFactoryBean.getFilters();
        //过滤器
        FormAuthenticationFilter authc=new FormAuthenticationFilter();
        authc.setUsernameParam("username");
        authc.setPasswordParam("password");
        filters.put("authc",authc);

        LogoutFilter logout=new LogoutFilter();
        logout.setRedirectUrl("/");
        filters.put("logout",logout);

        //anyRoleFilter
        AnyRoleFilter anyRoleFilter=new AnyRoleFilter();
        filters.put("anyRoleFilter",anyRoleFilter);

        //设置其他属性
        filterFactoryBean.setLoginUrl("/user/login");
        filterFactoryBean.setSuccessUrl("/main");
        filterFactoryBean.setUnauthorizedUrl("/unauth");

        //请求URL对应的过滤器链
        Map<String,String> filterChainMap=new LinkedHashMap<>();
        filterChainMap.put("/","anon");
        filterChainMap.put("/images/**","anon");
        filterChainMap.put("/style/**","anon");
        filterChainMap.put("/js/**","anon");
        filterChainMap.put("/ztree/**","anon");
        filterChainMap.put("/user/logout","logout");

        filterChainMap.put("/**","authc");
        filterFactoryBean.setFilterChainDefinitionMap(filterChainMap);
        return filterFactoryBean;
    }

}
