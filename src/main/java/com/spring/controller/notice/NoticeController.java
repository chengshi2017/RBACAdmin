package com.spring.controller.notice;

import com.github.pagehelper.Page;
import com.spring.common.utils.ResponseUtils;
import com.spring.controller.base.SuperController;
import com.spring.model.Notice;
import com.spring.service.notice.NoticeService;
import org.apache.ibatis.session.RowBounds;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Author 施成
 * @Date 2018/2/15
 * @time 13:49
 * @Describe:
 */
@Controller
@RequestMapping(value = "/notice")
public class NoticeController extends SuperController {

    private static final Logger Log= LoggerFactory.getLogger(NoticeController.class);

    @Autowired
    private NoticeService noticeService;


    @RequiresPermissions(value = "notice:page.html")
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    public String toPage(){
        return "notice/page.html";
    }

    @RequestMapping(value = "/date",method = RequestMethod.POST)
    public String date(Integer pageNo, @RequestParam(defaultValue = "10") Integer pageSize, Model model){

        Page<Notice> lists=noticeService.getAllMessageNotice(new RowBounds((pageNo-1)* pageSize,pageSize));
        model.addAttribute("lists",lists);
        return "notice/date";

    }

    //新增操作
    @RequestMapping(value = "/toUpdate",method = RequestMethod.GET)
    public String toAdd(){
        return "notice/update";
    }

    //修改操作
    @RequestMapping(value = "{noticeId}/toUpdate",method = RequestMethod.GET)
    public String toUpdate(@PathVariable(value = "noticeId") String noticeId, Model model){
        Notice notice=noticeService.getNoticeById(noticeId);
        model.addAttribute("notice",notice);
        return "notice/update";
    }

    //新增或修改的数据判断
    @RequestMapping(value = "toUpdate",method = RequestMethod.POST)
    public void toUpdate(Notice notice){

        if(notice.getNoticeId()==null){
            noticeService.insert(notice);
            ResponseUtils.writeSuccessReponse(request,response,"新增公告信息成功");
        }else {
            noticeService.update(notice);
            ResponseUtils.writeSuccessReponse(request,response,"修改公告信息系成功");
        }

    }

    //删除公告信息
    @RequestMapping(value = "{noticeId}/delete",method = RequestMethod.GET)
    public void delete(@PathVariable("noticeId") String noticeId){
        noticeService.delete(noticeId);
        ResponseUtils.writeSuccessReponse(request,response,"删除公告信息成功");
    }

}
