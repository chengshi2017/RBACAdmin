package com.spring.service.poi;

import com.spring.common.result.CodeMsg;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author: Jeremy
 * @Date: 2018/5/29
 * @Time: 15:32
 * @Version: 1.0
 * @Describe:
 */
public interface FileService {

    void download(HttpServletRequest request, HttpServletResponse response,String obj);

    CodeMsg upload(MultipartFile file);

    void downLoadAttend(HttpServletRequest request, HttpServletResponse response, String filter);
}
