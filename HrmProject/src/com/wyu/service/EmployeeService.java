package com.wyu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.wyu.pojo.Employee;

@Service
public interface EmployeeService {

	int addEmployee(Employee employee);

	List<Employee> selectAllEmployees();

	List<Employee> selectEmployeesLike(Employee employee);

	int delteEmployeeById(int id);

	int updateEmployee(Employee employee);

	List<Employee> SelectByCardId(String cardId);

	List<Employee> SelectByTel(String tel);

	List<Employee> SelectByPhone(String phone);

}
