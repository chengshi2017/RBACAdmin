package com.spring.common.shiro;

import com.spring.model.permission.User;
import com.spring.service.permission.MenuService;
import com.spring.service.permission.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author Sunny
 * @Date 2018/2/26
 * @time 8:40
 * @Describe: shiro自定义realm
 */
public class MyRealm extends AuthorizingRealm {

    private static final Logger logger= LoggerFactory.getLogger(MyRealm.class);

    @Autowired
    private UserService userService;

    @Autowired
    private MenuService menuService;

    /**
     * 对登陆的用户授权
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        //获取用户信息
        String currentUserName= (String) super.getAvailablePrincipal(principals);
        User user=userService.getUserByName(currentUserName);
        //判断用户是否为空
        if (user==null){
            throw new AuthenticationException();
        }
        SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
        //获取用户对应的权限
        List<String> permissions= menuService.getPermissionByUserId(user.getUserId());
        if (permissions!=null&&!permissions.isEmpty()){
            info.addStringPermissions(permissions);
        }else {
            info.addStringPermissions(new ArrayList<String>());
        }
        logger.info("授权成功");
        return info;

    }

    /**
     * 认证，验证当前登录的subject
     * @param authcToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        logger.info("开始认证");
        UsernamePasswordToken token= (UsernamePasswordToken) authcToken;
        //通过用户传入的用户名从数据库中获取用户信息
        String username=token.getUsername();
        User user=userService.getUserByName(username);
        //判断数据库中是否有该用户
        if(user==null){
            throw new AuthenticationException();
        }
        SimpleAuthenticationInfo info=new SimpleAuthenticationInfo(username,user.getUserPassword(),this.getName());
        //clearCache(info.getPrincipals());//清除缓存
        logger.info("认证成功");
        return info;
    }
}
