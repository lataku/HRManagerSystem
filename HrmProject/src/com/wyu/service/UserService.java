package com.wyu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.wyu.pojo.User;

@Service
public interface UserService {
	
	public User login(String number);

	public int addUser(User user);

	public List<User> findByPhone(String phone);

	public List<User> findByNumber(String number);

	public List<User> selectAllUsers();

	public List<User> selectUserLike(User user);

	public int delteUserByNumber(String number);

	public int updateUser(User user);
}
