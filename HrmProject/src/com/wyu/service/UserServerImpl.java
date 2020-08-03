package com.wyu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyu.mapper.UserCustomMapper;
import com.wyu.mapper.UserMapper;
import com.wyu.pojo.User;
import com.wyu.pojo.UserExample;
import com.wyu.pojo.UserExample.Criteria;

@Service
public class UserServerImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private UserCustomMapper userCustomMapper;
	
	@Override
	public User login(String number) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(number);
	}
	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.insertSelective(user);
	}
	@Override
	public List<User> findByPhone(String phone) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andPhoneEqualTo(phone);
		return userMapper.selectByExample(userExample);
	}
	@Override
	public List<User> findByNumber(String number) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andNumberEqualTo(number);
		return userMapper.selectByExample(userExample);
	}
	@Override
	public List<User> selectAllUsers() {
//		return userMapper.selectByExample(new UserExample());
		return userCustomMapper.selectUserAndRoleName();
	}
	@Override
	public List<User> selectUserLike(User user) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andNumberLike("%" + user.getNumber() + "%");
		criteria.andPhoneLike("%" + user.getPhone() + "%");
		criteria.andUsernameLike("%" + user.getUsername() + "%");
		if(null != user.getRoleId()) {
			criteria.andRoleIdEqualTo(user.getRoleId());
		}
		userExample.or();
		return userMapper.selectByExample(userExample);
	}
	@Override
	public int delteUserByNumber(String number) {
		return userMapper.deleteByPrimaryKey(number);
	}
	@Override
	public int updateUser(User user) {
		return userMapper.updateByPrimaryKeySelective(user);
	}

}
