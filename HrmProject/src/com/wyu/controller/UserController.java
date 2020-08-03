package com.wyu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyu.pojo.User;
import com.wyu.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(String number, String password, HttpSession session, Model model) {
        User user = userService.login(number);
        String loginInfo = "用户不存在!";
        if (null != user) {
            if (password.equals(user.getPassword())) {
                System.out.println(user.getUsername()+"登录成功");
                session.setAttribute("username", user.getUsername());
                return "index";
            } else {
                loginInfo = "密码错误!";
                System.out.println("密码错误!");
            }
        }
        model.addAttribute("loginInfo", loginInfo);
        return "login";
    }

    @RequestMapping("/addUser")
    @ResponseBody
    public String addUser(User user, Model model) {
        System.out.println(user);
        String addInfo = "0";
        if (null == user.getNumber()) return addInfo;
        int in = userService.addUser(user);
        if (in > 0) {
            System.out.println("添加用户成功!");
            addInfo = "1";
        }

        model.addAttribute("addInfo", addInfo);

        return addInfo;
    }

    @RequestMapping("/numberAjax")
    @ResponseBody
    public String numberAjax(String number) {
        List<User> userList = userService.findByNumber(number);
        if (userList.isEmpty()) return "0";
        userList.forEach(li -> System.out.println(li));
        return "1";
    }

    @RequestMapping("/phoneAjax")
    @ResponseBody
    public String phoneAjax(String phone) {
        List<User> userList = userService.findByPhone(phone);
        if (userList.isEmpty()) return "0";
        return "1";
    }

    @RequestMapping(value = "/selectAllUsers", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String selectAllUsers(int page, int rows) {
        // 使用分页插件完成分页
        PageHelper.startPage(page, rows);
        List<User> userList = userService.selectAllUsers();
        String listJson = JSON.toJSONString(userList);
        PageInfo info = new PageInfo<>(userList);
        long total = info.getTotal();
//        System.out.println("--selectAllUser--page:" + page + ",row:" + rows + ",total:" + total);
        String json = "{\"total\":" + total + ",\"rows\":" + listJson + "}";
//		System.out.println(json);
        return json;
    }

    @RequestMapping(value = "/selectUsersLike", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String selectUsersLike(User user, int page, int rows) {
        System.out.println(user);
        // 使用分页插件完成分页
        PageHelper.startPage(page, rows);
        List<User> userList = userService.selectUserLike(user);
        String listJson = JSON.toJSONString(userList);
        PageInfo info = new PageInfo<>(userList);
        long total = info.getTotal();
        System.out.println("--模糊查询--page:" + page + ",row:" + rows + ",total:" + total);
        String json = "{\"total\":" + total + ",\"rows\":" + listJson + "}";
        System.out.println(json);
        return json;
    }

	@RequestMapping(value = "/deleteUser", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String deleteUser(String number) {
		String delInfo = "删除失败!";
		int in = userService.delteUserByNumber(number);
		if(in > 0) delInfo = "删除成功!";
		return delInfo;
	}
	
	@RequestMapping(value = "/updateUser", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String updateUser(User user) {
		System.out.println(user);
		String updInfo = "修改失败!";
		int in = userService.updateUser(user);
		if(in > 0) updInfo = "修改成功!";
		return updInfo;
	}

}