package com.wyu.mapper;

import java.util.List;

import com.wyu.pojo.Employee;

public interface EmployeeCustomMapper {
	List<Employee> selectAllEmployeesJoined();
}
