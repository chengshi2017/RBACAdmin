package com.spring.common.aop;

import com.spring.common.utils.Constants;
import com.spring.common.utils.SysInfo;
import com.spring.model.Log;
import com.spring.model.permission.User;
import com.spring.service.log.LogService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @Author Sunny
 * @Date 2018/3/4
 * @time 9:29
 * @Describe: aop切面记录用户对系统的操作
 */
@Aspect
@Component
public class OperateLogAspect {

    private static Logger logger = LoggerFactory.getLogger(OperateLogAspect.class);

    @Resource
    private LogService logService;

    //定义切点  controller类下面的带有RequiresPermissions(requestmapping)注解的方法  (org.springframework.web.bind.annotation.RequestMapping)
    @Around("execution(public * com.spring.controller..*(..)) && @annotation(org.apache.shiro.authz.annotation.RequiresPermissions))")
    public Object doMain(ProceedingJoinPoint proceedingJoinPoint){
        logger.info("=======>开始记录操作记录");
        //初始化log
        Log log = new Log();

        //获取request对象
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes sra = (ServletRequestAttributes) ra;
        HttpServletRequest request = sra.getRequest();
        //获取参数
        String url = request.getRequestURL().toString();
        String method = request.getMethod();
        String uri = request.getRequestURI();
        String queryString = request.getQueryString();

        logger.info("请求开始, 各个参数, url: {}, method: {}, uri: {}, params: {}", url, method, uri, queryString);

        //设置操作的返回码
        Object obj = null;
        try {
            obj = proceedingJoinPoint.proceed();
            log.setResponseCode(Constants.ResponseCode.success + "");
        } catch (Throwable throwable) {
            throwable.printStackTrace();
            log.setResponseCode(Constants.ResponseCode.error + "");
        }

        //记录操作记录日志
        User user = (User) request.getSession().getAttribute(Constants.Regular.onlineUser);
        if(user != null){
            log.setUserId(user.getUserId());                    //设置操作人
            log.setRequestUrl(uri);                             //设置请求路径
            log.setIp(SysInfo.getDefaultIpAddress());
            logService.addOperateLog(log);
        }
        logger.info("=======>记录操作记录结束");
        return obj;
    }

}
