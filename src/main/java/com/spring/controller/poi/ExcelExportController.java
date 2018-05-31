package com.spring.controller.poi;

import com.spring.common.result.CodeMsg;
import com.spring.common.result.Result;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.Dept;
import com.spring.model.Emp;
import com.spring.model.poi.DeptEntity;
import com.spring.service.dept.DeptService;
import com.spring.service.emp.EmpService;
import com.spring.service.poi.FileService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @Author: Jeremy
 * @Date: 2018/5/29
 * @Time: 7:45
 * @Version: 1.0
 * @Describe:
 */
@Controller
@RequestMapping(value = "/excel")
public class ExcelExportController extends SuperController {

    @Autowired
    private FileService fileService;

    @RequestMapping(value = "/deptExcel")
    public void exportDeptExcel(){
        String obj= "dept";
        fileService.download(request,response,obj);
    }

    @RequestMapping(value = "/userExcel")
    public void exportUserExcel(){
        String obj= "user";
        fileService.download(request,response,obj);

    }


    @RequestMapping(value = "/doImport")
    public Result<CodeMsg> doImport(@RequestParam("file")MultipartFile file){
        CodeMsg codeMsg=fileService.upload(file);
        return Result.success(codeMsg);
    }






}
