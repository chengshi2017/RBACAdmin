package com.spring.service.poi;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import cn.afterturn.easypoi.excel.entity.result.ExcelImportResult;
import com.spring.common.exceptions.MyException;
import com.spring.common.result.CodeMsg;
import com.spring.common.utils.DateUtils;
import com.spring.common.utils.EncodeMD5;
import com.spring.common.utils.UUID;
import com.spring.dao.DeptMapper;
import com.spring.dao.UserMapper;
import com.spring.model.Log;
import com.spring.model.permission.User;
import com.spring.model.poi.DeptEntity;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

/**
 * @Author: Jeremy
 * @Date: 2018/5/29
 * @Time: 15:35
 * @Version: 1.0
 * @Describe:
 */
@Service
public class FileServiceImpl implements FileService{

    private static final Logger log= LoggerFactory.getLogger(FileServiceImpl.class);

    @Autowired
    private DeptMapper deptMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public void download(HttpServletRequest request, HttpServletResponse response,String obj)  {
        try {
            response.setHeader("content-Type", "application/vnd.ms-excel");
            //编码
            response.setCharacterEncoding("UTF-8");
            String date=DateUtils.getCurrentTime();
            Workbook workbook=null;
            if (obj.equals("dept")){
                //下载文件时默认名
                response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("部门信息报表","UTF-8") + ".xls");
                List<DeptEntity> list=deptMapper.getMessage();
                workbook= ExcelExportUtil.exportExcel(new ExportParams("部门信息报表",date+"_部门信息报表"),DeptEntity.class,list);
            }
            if (obj.equals("user")){
                //下载文件时默认名
                response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("用户信息报表","UTF-8") + ".xls");
                List<User> list=userMapper.getAllMessage();
                workbook=ExcelExportUtil.exportExcel(new ExportParams("用户信息报表",date+"_用户信息报表"),User.class,list);
            }
            workbook.write(response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public CodeMsg upload(MultipartFile file) {
        //截取文件名后缀字段
        String fileName=file.getOriginalFilename();
        String suffix=fileName.substring(fileName.lastIndexOf("."),fileName.length());

        //判断是否属于正常的excel表格，如果不属于直接返回上传文件异常
        if (!".xls".equals(suffix) && !".xlsx".equals(suffix)){
            return CodeMsg.FilE_ERROR;
        }
        ImportParams importParams = new ImportParams();
        //设置是否需要验证
        importParams.setNeedVerfiy(true);
        try {
            ExcelImportResult<User> result = ExcelImportUtil.importExcelMore(file.getInputStream(), User.class, importParams);
            // 当结果中通过校验的数据(result.getList())为空时
            // 直接返回“上传Excel表格格式有误<br>或者<br> 上传Excel数据为空”(CodeMsg.Excel_FORMAT_ERROR)
            if (result.getList().size()==0 || result.getList().get(0)==null){
                return CodeMsg.Excel_FORMAT_ERROR;
            }
            //saveToDataBase(result);
            int succSize=result.getList().size();
            int failSize=result.getFailList().size();
            String msg = "在Excel数据格式校验环节中，共获得有效数据" + (succSize + failSize) + "条</br>其中," + succSize
                    + "条数据通过格式校验," + failSize + "条数据未通过格式校验 </br> 是否需要查看完整数据同步结果信息？";
            return CodeMsg.userDefined(msg);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
        }
        // 当以上过程中抛出异常时，返回"服务端异常，请您联系管理员查看服务器日志"(CodeMsg.SERVER_ERROR)
        return CodeMsg.SERVER_ERROR;
    }

//    @Transactional
//    private void saveToDataBase(ExcelImportResult<User> result) {
//        List<User> succList=result.getList();
//        List<User> failList=result.getFailList();
//        //将成功的数据存入mysql数据库
//        for (User user:succList){
//            user.setUserId(UUID.getUUID());
//            user.setUserPassword(EncodeMD5.GetMD5Code(user.getUserPassword()));
//            if (userMapper.insert(user)<1){
//                throw new MyException("新增用户信息失败");
//            }
//        }
//        //将失败的数据存入redis数据库,待续
//    }
}

