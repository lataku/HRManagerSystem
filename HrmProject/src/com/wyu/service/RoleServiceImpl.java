package com.wyu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyu.mapper.RoleMapper;
import com.wyu.pojo.Role;
import com.wyu.pojo.RoleExample;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public List<Role> selectAllRoles() {
		RoleExample roleExample = new RoleExample();
		return roleMapper.selectByExample(roleExample);
	}

}
