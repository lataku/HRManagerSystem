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
import com.wyu.pojo.Dept;
import com.wyu.service.DeptService;

@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;

    @RequestMapping("/addDept")
    @ResponseBody
    public String addDept(Dept dept, Model model) {
        System.out.println(dept);
        String addInfo = "0";
        int in = deptService.addDept(dept);
        if (in > 0) {
            System.out.println("添加部门成功!");
            addInfo = "1";
        }
        System.out.println(in);
        model.addAttribute("addInfo", addInfo);

        return addInfo;
    }

    @RequestMapping(value = "/selectAllDepts", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String selectAllDepts(int page, int rows) {
         //使用分页插件完成分页
        PageHelper.startPage(page, rows);
        List<Dept> deptList = deptService.selectAllDepts();
        String listJson = JSON.toJSONString(deptList);
        PageInfo info = new PageInfo<>(deptList);
        long total = info.getTotal();
        System.out.println("--selectAllDept--page:" + page + ",row:" + rows + ",total:" + total);
        String json = "{\"total\":" + total + ",\"rows\":" + listJson + "}";
//		System.out.println(json);
        return json;
    }
    
    @RequestMapping(value = "/selectAllDeptsForSelecting", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String selectAllDepts() {
    	List<Dept> deptList = deptService.selectAllDepts();
    	String listJson = JSON.toJSONString(deptList);
//		System.out.println(listJson);
    	return listJson;
    }

    @RequestMapping(value = "/selectDeptsLike", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String selectDeptsLike(Dept dept, int page, int rows) {
        System.out.println(dept);
         //使用分页插件完成分页
        PageHelper.startPage(page, rows);
        List<Dept> deptList = deptService.selectDeptLike(dept);
        String listJson = JSON.toJSONString(deptList);
        PageInfo info = new PageInfo<>(deptList);
        long total = info.getTotal();
        System.out.println("--模糊查询--page:" + page + ",row:" + rows + ",total:" + total);
        String json = "{\"total\":" + total + ",\"rows\":" + listJson + "}";
        System.out.println(json);
        return json;
    }

	@RequestMapping(value = "/deleteDept", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String deleteDept(int did) {
		String delInfo = "删除失败!";
		int in = deptService.delteDeptById(did);
		if(in > 0) delInfo = "删除成功!";
		return delInfo;
	}
	
	@RequestMapping(value = "/updateDept", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String updateDept(Dept dept) {
		System.out.println(dept);
		String updInfo = "修改失败!";
		int in = deptService.updateDept(dept);
		if(in > 0) updInfo = "修改成功!";
		return updInfo;
	}
	
    @RequestMapping("/dnameAjax")
    @ResponseBody
    public String dnameAjax(String dname) {
//    	System.out.println("----dnameAjax------"+dname);
        List<Dept> deptList = deptService.SelectBydName(dname);
        if (deptList.isEmpty()) return "0";
        deptList.forEach(li -> System.out.println(li));
        return "1";
    }

}