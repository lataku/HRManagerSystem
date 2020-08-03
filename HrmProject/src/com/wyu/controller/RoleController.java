package com.wyu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.wyu.pojo.Role;
import com.wyu.service.RoleService;

@Controller
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value="/selectAllRoles", produces="application/json;charset=utf-8")
	@ResponseBody
	public String selectAllRoles() {
		List<Role> roleList = roleService.selectAllRoles();
		String json = JSON.toJSONString(roleList);
//		System.out.println(json);
		return json;
	}
}
