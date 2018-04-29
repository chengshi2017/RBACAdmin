package com.spring.controller.base;

import com.spring.common.Enums.LogTypeEnums;
import com.spring.common.exceptions.ResponseInfo;
import com.spring.common.utils.Constants;
import com.spring.common.utils.CreateImageCode;
import com.spring.common.utils.EncodeMD5;
import com.spring.model.Log;
import com.spring.model.permission.Menu;
import com.spring.model.permission.User;
import com.spring.service.log.LogService;
import com.spring.service.permission.MenuService;
import com.spring.service.permission.UserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @Author Sunny
 * @Date 2018/2/23
 * @time 17:13
 * @Describe:
 */
@Controller
public class IndexController extends SuperController {

    private static final org.slf4j.Logger Logger= LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private LogService logService;

    @Autowired
    private MenuService menuService;


    @RequestMapping(value = {"/"},method = RequestMethod.GET)
    public String root(){
        return "redirect:login.html";
    }


    @RequestMapping(value = {"login"},method = RequestMethod.GET)
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/captcha-image")
    public void captcha(HttpServletResponse response, HttpSession session)throws IOException{
        CreateImageCode VCode=new CreateImageCode(140,45,5,10);
        session.setAttribute("code",VCode.getCode());
        VCode.write(response.getOutputStream());
    }

    @RequestMapping(value = "/loginIn")
    public String login(User info, String captcha, Model model){

        ResponseInfo<String> responseInfo=new ResponseInfo<>();
        Logger.info("开始执行登陆操作！");
        Logger.info("判断数据是否为空");
        //用户信息为空判断，为空返回登陆页面
        if (info==null || StringUtils.isEmpty(info.getUserName())||StringUtils.isEmpty(info.getUserPassword())|| StringUtils.isEmpty(captcha)){
            model.addAttribute("error","用户名，密码，验证码不能为空");
            return "login";
        }
        //开始判断验证码是否正确，错误返回登陆页面
        String expected=(String)request.getSession().getAttribute("code");
        if(!captcha.equalsIgnoreCase(expected)){
            Logger.info("验证码错误...");
            model.addAttribute("error","验证码错误");
            return "login";
        }
        Logger.info("开始shiro权限验证");

        try {
            Subject currentUser=SecurityUtils.getSubject();
            UsernamePasswordToken token=new UsernamePasswordToken(info.getUserName(), EncodeMD5.GetMD5Code(info.getUserPassword()),true);
            //token.setRememberMe(true);
            currentUser.login(token);
            if(currentUser.isAuthenticated()){
                //通过权限验证，将当前用户添加到session,并返回首页
                session.setAttribute(Constants.Regular.onlineUser,userService.getUserByName(info.getUserName()));
                //写入数据库登录日志
                Log log=new Log();
                log.setLogTypeId(LogTypeEnums.LOGIN.getValue()); //设置日志类型
                log.setRequestUrl(request.getRequestURI().toString());
                log.setUserId(getUser().getUserId());
                log.setRemark("登录日志");
                logService.addloginLog(log);
                Logger.info("登录成功，进入首页");
                return "redirect:index.html";
            }
        } catch (AuthenticationException e) {
            Logger.info("登录验证失败，错误原因 "+e.getMessage());
            e.printStackTrace();
        }
        model.addAttribute("error","密码错误或者登录用户名不存在，请重试");
        Logger.info("返回登录页面");
        return "login";
    }

    @RequestMapping(value = {"index.html"})
    public String indexPage(Model model){

        Logger.info("加载首页资源");
        User user=getUser();
        if(user==null){
            Logger.info("用户信息有误");
            model.addAttribute("error","用户不存在，请重试");
            return "redirect:login.html";
        }
        //从数据库中查询menu,一级菜单
        List<Menu> menus=menuService.getFirstLevelMenusByUserId(user.getUserId());
        //加载二级菜单信息
        for (Menu menu:menus){
            List<Menu> menuItems=menuService.getMenusByParentId(menu.getMenuId());
            menu.setListMenus(menuItems);
        }
        model.addAttribute("menus",menus);
        model.addAttribute(Constants.Regular.onlineUser,getUser());
        return "index";
    }

    @RequestMapping(value = "welcome",method = RequestMethod.GET)
    public String welcome(){
        return "welcome";
    }

    @RequestMapping(value = "loginOut",method = RequestMethod.GET)
    public String loginOut(){
        session.setAttribute(Constants.Regular.onlineUser, null);
        session.invalidate();
        return "redirect:login.html";
    }





}
