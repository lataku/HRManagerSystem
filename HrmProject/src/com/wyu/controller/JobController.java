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
import com.wyu.pojo.Job;
import com.wyu.service.JobService;

@Controller
public class JobController {

    @Autowired
    private JobService jobService;

    @RequestMapping("/addJob")
    @ResponseBody
    public String addDept(Job job, Model model) {
        System.out.println(job);
        String addInfo = "0";
        int in = jobService.addJob(job);
        if (in > 0) {
            System.out.println("���ְλ�ɹ�!");
            addInfo = "1";
        }

        model.addAttribute("addInfo", addInfo);

        return addInfo;
    }

    @RequestMapping(value = "/selectAllJobs", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String selectAllJobs(int page, int rows) {
         //ʹ�÷�ҳ�����ɷ�ҳ
        PageHelper.startPage(page, rows);
        List<Job> jobList = jobService.selectAllJobs();
        String listJson = JSON.toJSONString(jobList);
        PageInfo info = new PageInfo<>(jobList);
        long total = info.getTotal();
        System.out.println("--selectAllJob--page:" + page + ",row:" + rows + ",total:" + total);
        String json = "{\"total\":" + total + ",\"rows\":" + listJson + "}";
//		System.out.println(json);
        return json;
    }
    
    @RequestMapping(value = "/selectAllJobsForSelecting", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String selectAllJobs() {
    	List<Job> jobList = jobService.selectAllJobs();
    	String listJson = JSON.toJSONString(jobList);
//		System.out.println(listJson);
    	return listJson;
    }

    @RequestMapping(value = "/selectJobsLike", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String selectJobsLike(Job job, int page, int rows) {
        System.out.println(job);
         //ʹ�÷�ҳ�����ɷ�ҳ
        PageHelper.startPage(page, rows);
        List<Job> jobList = jobService.selectJobLike(job);
        String listJson = JSON.toJSONString(jobList);
        PageInfo info = new PageInfo<>(jobList);
        long total = info.getTotal();
        System.out.println("--ģ����ѯ--page:" + page + ",row:" + rows + ",total:" + total);
        String json = "{\"total\":" + total + ",\"rows\":" + listJson + "}";
        System.out.println(json);
        return json;
    }

	@RequestMapping(value = "/deleteJob", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String deleteJob(int jid) {
		String delInfo = "ɾ��ʧ��!";
		int in = jobService.delteJobById(jid);
		if(in > 0) delInfo = "ɾ���ɹ�!";
		return delInfo;
	}
	
	@RequestMapping(value = "/updateJob", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String updateJob(Job job) {
		System.out.println(job);
		String updInfo = "�޸�ʧ��!";
		int in = jobService.updateJob(job);
		if(in > 0) updInfo = "�޸ĳɹ�!";
		return updInfo;
	}
	
    @RequestMapping("/jnameAjax")
    @ResponseBody
    public String jnameAjax(String jname) {
    	System.out.println("----jnameAjax------"+jname);
        List<Job> jobList = jobService.SelectByjName(jname);
        if (jobList.isEmpty()) return "0";
        jobList.forEach(li -> System.out.println(li));
        return "1";
    }

}