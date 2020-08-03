package com.wyu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyu.pojo.Notice;
import com.wyu.service.NoticeService;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/addNotice")
    @ResponseBody
    public String addNotice(Notice notice, Model model) {
        System.out.println(notice);
        String addInfo = "0";
        int in = noticeService.addNotice(notice);
        if (in > 0) {
            System.out.println("添加公告成功!");
            addInfo = "1";
        }
        System.out.println(in);
        model.addAttribute("addInfo", addInfo);

        return addInfo;
    }

    @RequestMapping(value = "/selectAllNotices", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String selectAllNotices(int page, int rows) {
         //使用分页插件完成分页
        PageHelper.startPage(page, rows);
        List<Notice> noticeList = noticeService.selectAllNotices();
        String listJson = JSON.toJSONString(noticeList);
        PageInfo info = new PageInfo<>(noticeList);
        long total = info.getTotal();
        System.out.println("--selectAllNotice--page:" + page + ",row:" + rows + ",total:" + total);
        String json = "{\"total\":" + total + ",\"rows\":" + listJson + "}";
		System.out.println(json);
        return json;
    }
    
    @RequestMapping(value = "/selectNoticesLike", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String selectNoticesLike(Notice notice, int page, int rows) {
        System.out.println(notice);
         //使用分页插件完成分页
        PageHelper.startPage(page, rows);
        List<Notice> noticeList = noticeService.selectNoticeLike(notice);
        String listJson = JSON.toJSONString(noticeList);
        PageInfo info = new PageInfo<>(noticeList);
        long total = info.getTotal();
        System.out.println("--模糊查询--page:" + page + ",row:" + rows + ",total:" + total);
        String json = "{\"total\":" + total + ",\"rows\":" + listJson + "}";
        System.out.println(json);
        return json;
    }

	@RequestMapping(value = "/deleteNotice", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String deleteNotice(int id) {
		String delInfo = "删除失败!";
		int in = noticeService.delteNoticeById(id);
		if(in > 0) delInfo = "删除成功!";
		return delInfo;
	}
	
	@RequestMapping(value = "/updateNotice", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String updateNotice(Notice notice) {
		System.out.println(notice);
		String updInfo = "修改失败!";
		int in = noticeService.updateNotice(notice);
		if(in > 0) updInfo = "修改成功!";
		return updInfo;
	}
	

}