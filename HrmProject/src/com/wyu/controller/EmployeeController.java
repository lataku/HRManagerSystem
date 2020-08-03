package com.wyu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyu.pojo.Employee;
import com.wyu.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	@RequestMapping("/addEmployee")
	@ResponseBody
	public String addEmployee(Employee employee, Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat();// 格式化时间
		sdf.applyPattern("yyyy-MM-dd HH:mm:ss a");// a为am/pm的标记
		Date date = new Date();// 获取当前时间
		employee.setCreateDate(sdf.format(date));
		System.out.println(employee);
		String addInfo = "0";
		int in = employeeService.addEmployee(employee);
		if (in > 0) {
			System.out.println("添加员工成功!");
			addInfo = "1";
		}
		System.out.println(in);
		model.addAttribute("addInfo", addInfo);

		return addInfo;
	}

//	@RequestMapping("/testDate")
//	@ResponseBody
//	public String testDate(String birthday) {
//		System.out.println("Test:" + birthday);
//		return "";
//	}

	@RequestMapping(value = "/selectAllEmployees", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String selectAllEmployees(int page, int rows) {
		// 使用分页插件完成分页
		PageHelper.startPage(page, rows);
		List<Employee> employeeList = employeeService.selectAllEmployees();
		String listJson = JSON.toJSONString(employeeList);
		PageInfo info = new PageInfo<>(employeeList);
		long total = info.getTotal();
		System.out.println("--selectAllEmployee--page:" + page + ",row:" + rows + ",total:" + total);
		String json = "{\"total\":" + total + ",\"rows\":" + listJson + "}";
//		System.out.println(json);
		return json;
	}

    @RequestMapping(value = "/selectEmployeesLike", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String selectEmployeesLike(Employee employee, int page, int rows) {
        System.out.println(employee);
         //使用分页插件完成分页
        PageHelper.startPage(page, rows);
        List<Employee> employeeList = employeeService.selectEmployeesLike(employee);
        String listJson = JSON.toJSONString(employeeList);
        PageInfo info = new PageInfo<>(employeeList);
        long total = info.getTotal();
        System.out.println("--模糊查询--page:" + page + ",row:" + rows + ",total:" + total);
        String json = "{\"total\":" + total + ",\"rows\":" + listJson + "}";
        System.out.println(json);
        return json;
    }

	@RequestMapping(value = "/deleteEmployee", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String deleteEmployee(int id) {
		String delInfo = "删除失败!";
		int in = employeeService.delteEmployeeById(id);
		if (in > 0)
			delInfo = "删除成功!";
		return delInfo;
	}

	@RequestMapping(value = "/updateEmployee", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String updateEmployee(Employee employee) {
		SimpleDateFormat sdf = new SimpleDateFormat();// 格式化时间
		sdf.applyPattern("yyyy-MM-dd HH:mm:ss a");// a为am/pm的标记
		Date date = new Date();// 获取当前时间
		employee.setCreateDate(sdf.format(date));
		System.out.println(employee);
		String updInfo = "0";
		int in = employeeService.updateEmployee(employee);
		if (in > 0)
			updInfo = "1";
		System.out.print(updInfo);
		return updInfo;
	}

	@RequestMapping("/cardIdAjax")
	@ResponseBody
	public String cardIdAjax(String cardId) {
		System.out.println("----cardIdAjax------" + cardId);
		if(cardId == null) return "0";
		List<Employee> employeeList = employeeService.SelectByCardId(cardId);
		if (employeeList.isEmpty())
			return "0";
		employeeList.forEach(li -> System.out.println(li));
		return "1";
	}

//    @RequestMapping("/EtelAjax")
//    @ResponseBody
//    public String telAjax(String tel) {
//    	System.out.println("----telAjax------"+ tel);
//    	List<Employee> employeeList = employeeService.SelectByTel(tel);
//    	if (employeeList.isEmpty()) return "0";
//    	employeeList.forEach(li -> System.out.println(li));
//    	return "1";
//    }

	@RequestMapping("/EphoneAjax")
	@ResponseBody
	public String phoneAjax(String phone) {
		System.out.println("----phoneAjax------" + phone);
		List<Employee> employeeList = employeeService.SelectByPhone(phone);
		if (employeeList.isEmpty())
			return "0";
		employeeList.forEach(li -> System.out.println(li));
		return "1";
	}

}