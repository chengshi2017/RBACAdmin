package com.spring.common.exceptions;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author: Jeremy
 * @Date: 2018/6/3
 * @Time: 17:51
 * @Version: 1.0
 * @Describe:
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(value = Exception.class)
    public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
        ModelAndView mav = new ModelAndView();
        mav.addObject("exception", e);
        mav.addObject("url", req.getRequestURL());
        mav.setViewName("error");
        return mav;
    }

    /**
     * 自定义异常处理
     * @param req
     * @param e
     * @return
     * @throws Exception
     */
    @ExceptionHandler(value = MyException.class)
    @ResponseBody
    public ResponseInfo<String> exceptionHandler(HttpServletRequest req, MyException e) throws Exception {
        ResponseInfo<String> r = new ResponseInfo<>();
        r.setMessage(e.getMessage());
        r.setCode(ResponseInfo.ERROR);
        r.setData("操作出错......");
        r.setUrl(req.getRequestURL().toString());
        return r;
    }

}
