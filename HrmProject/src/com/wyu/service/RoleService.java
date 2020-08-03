package com.wyu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.wyu.pojo.Role;

@Service
public interface RoleService {

	List<Role> selectAllRoles();
}
