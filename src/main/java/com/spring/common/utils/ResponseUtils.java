package com.spring.common.utils;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.spring.common.exceptions.ResponseInfo;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author 施成
 * @Date 2018/2/11
 * @time 0:48
 * @Describe:
 */
public class ResponseUtils {
    static final Logger logger = LoggerFactory.getLogger(ResponseUtils.class);

    public static String DEFALT_ENCODING = "UTF-8";

    public static String DEFAULT_JSONP = "jsoncallback";

    public static final String RESPONSE_CODE = "code";
    public static final String RESPONSE_MSG = "msg";
    public static final String RESPONSE_DATA = "data";
    public static final String RESPONSE_TOTAL = "total";

    /**
     * 设置contentType header 以及响应编码，
     * 编码从response的getCharacterEncoding中获取，如果次编码为空，则设置为默认编码（UTF-8）
     * @param response
     */
    public static void setContentTypeHeader(HttpServletResponse response){
        String encoding = response.getCharacterEncoding();
        if(StringUtils.isBlank(encoding)){
            encoding = DEFALT_ENCODING;
            response.setCharacterEncoding(encoding);
        }
        response.setContentType("text/html;charset="+encoding);
    }

    /**
     * 设置不缓存响应头
     * @param response
     */
    public static void setNoCacheHeader(HttpServletResponse response){
        response.setHeader("pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache,no-store");
        response.setDateHeader("Expires", 0);
    }


    /**
     * 设置缓存响应头
     * @param response
     * @param seconds
     */
    public static void setCacheHeader(HttpServletResponse response, int seconds){
        if(seconds <= 0)
            return;
        response.setHeader("Cache-Control", "mag-age=" + seconds);
        response.setDateHeader("Last-modified", System.currentTimeMillis());
        response.setDateHeader("Expires", System.currentTimeMillis() + seconds * 60 * 1000);
    }

    public static void setHtmlContentCacheHeader(HttpServletResponse response, int seconds) {
        setContentTypeHeader(response);
        setCacheHeader(response, seconds);
    }

    /**
     * 向客户端写响应内容
     *
     * @param response http响应
     * @param content 需要写到浏览器的响应内容
     */
    public static void writeResponse(HttpServletRequest request, HttpServletResponse response, String content) {
        Writer writer = null;
        try {
            String jsoncallback = request.getParameter(DEFAULT_JSONP);
//			if (!WebTool.checkCallbackName(jsoncallback, response)) {
//				return;
//			}
            setContentTypeHeader(response);
            writer = response.getWriter();
            if (StringUtils.isBlank(jsoncallback)) {
                writer.write(content);
            } else {
                writer.write(jsoncallback + "(" + content + ")");
            }
        } catch (IOException e) {
            logger.error("write response error", e);
        } finally {
            if(writer != null){
                try {
                    writer.close();
                } catch (IOException e) {
                    logger.error("write response error", e);
                }
            }
        }
    }

    public static void writeResponse(HttpServletRequest request, HttpServletResponse response, int code, String msg,
                                     Object data) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(RESPONSE_CODE, code);
        result.put(RESPONSE_MSG, msg);
        result.put(RESPONSE_DATA, data);
        if(data instanceof Page){
            Page<?> list = (Page<?>)(data);
            result.put(RESPONSE_TOTAL, list.getTotal());
        }
        writeResponse(request, response, JSON.toJSONString(result));//,SerializerFeature.BrowserCompatible));
    }

    public static void writeSuccessReponse(HttpServletRequest request, HttpServletResponse response, Object data) {
        writeResponse(request, response, Constants.ResponseCode.success, "success", data );
    }

    public static void writeErrorResponse(HttpServletRequest request, HttpServletResponse response, Object data) {
        writeResponse(request, response, Constants.ResponseCode.error, "error", data );
    }

    public static String getDefaultJsonp() {
        return DEFAULT_JSONP;
    }

    /**
     * 设置默认的JSONP的回调函数参数名
     *
     * @param jsoncallback
     */
    public static void setDefaultJsonp(String jsoncallback) {
        DEFAULT_JSONP = jsoncallback;
    }

    /**
     * 刷新页面
     * @param request
     * @param response
     *
     */
    public static void refreshParent(HttpServletRequest request, HttpServletResponse response){
        String html = "<script>parent.location.reload();</script>";
        writeResponse(request,response,html);
    }

    public static boolean isAjax(HttpServletRequest request) {
        if(request.getRequestURI().endsWith(".json")){
            return true;
        }
        return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
    }

    /***
     * @description  返回成功  json字符串
     * @param data
     * @return
     */
    public static String responseSuccess(String data){
        ResponseInfo<String> responseInfo = new ResponseInfo<String>();
        responseInfo.setMessage("success");
        responseInfo.setCode(Constants.ResponseCode.success);
        responseInfo.setData(data);
        return JSON.toJSONString(responseInfo);
    }

    /***
     * @description  返回失败 json字符串
     * @param data
     * @return
     */
    public static String responseError(String data){
        ResponseInfo<String> responseInfo = new ResponseInfo<String>();
        responseInfo.setMessage("error");
        responseInfo.setCode(Constants.ResponseCode.error);
        responseInfo.setData(data);
        return JSON.toJSONString(responseInfo);
    }
}
