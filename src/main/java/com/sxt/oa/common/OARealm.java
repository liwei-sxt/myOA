package com.sxt.oa.common;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.stereotype.Component;

@Component
public class OARealm extends AuthorizingRealm {

    public OARealm(){
        super.setName("oa_realm");
    }
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //返回用户的角色和权限
        System.out.println("返回用户的角色和权限");
        SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
        info.addRole("admin");
        info.addRole("user");
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String userId=authenticationToken.getPrincipal().toString();
        System.out.println("根据userId从数据库中读取信息");
        AuthenticationInfo info=new SimpleAuthenticationInfo(userId,"123",super.getName());
        return info;
    }
}
