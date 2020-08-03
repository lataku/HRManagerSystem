package com.wyu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyu.mapper.EmployeeCustomMapper;
import com.wyu.mapper.EmployeeMapper;
import com.wyu.pojo.Employee;
import com.wyu.pojo.EmployeeExample;
import com.wyu.pojo.EmployeeExample.Criteria;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private EmployeeCustomMapper employeeCustomMapper;
	
	@Override
	public int addEmployee(Employee employee) {
		return employeeMapper.insertSelective(employee);
	}

	@Override
	public List<Employee> selectAllEmployees() {
		return employeeCustomMapper.selectAllEmployeesJoined();
	}

	@Override
	public List<Employee> selectEmployeesLike(Employee employee) {
		EmployeeExample employeeExample = new EmployeeExample();
		Criteria criteria = employeeExample.createCriteria();
		if(employee.getId() != null) {
			criteria.andIdEqualTo(employee.getId());
		}
		if(employee.getDeptId()!=null) {
			criteria.andDeptIdEqualTo(employee.getDeptId());
		}
		if(employee.getJobId()!=null) {
			criteria.andJobIdEqualTo(employee.getJobId());
		}
		employeeExample.or();
		criteria.andNameLike("%" + employee.getName() +"%");
		criteria.andAddressLike("%"+employee.getAddress()+"%");
		criteria.andCardIdLike("%" + employee.getCardId() +"%");
		criteria.andPhoneLike("%" + employee.getPhone() +"%");
		criteria.andSexEqualTo(employee.getSex());
		return employeeMapper.selectByExample(employeeExample);
	}

	@Override
	public int delteEmployeeById(int id) {
		return employeeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateEmployee(Employee employee) {
		return employeeMapper.updateByPrimaryKeySelective(employee);
	}

	@Override
	public List<Employee> SelectByCardId(String cardId) {
		EmployeeExample employeeExample = new EmployeeExample();
		Criteria criteria = employeeExample.createCriteria();
		criteria.andCardIdEqualTo(cardId);
		return employeeMapper.selectByExample(employeeExample);
	}

	@Override
	public List<Employee> SelectByTel(String tel) {
		EmployeeExample employeeExample = new EmployeeExample();
		Criteria criteria = employeeExample.createCriteria();
		criteria.andTelEqualTo(tel);
		return employeeMapper.selectByExample(employeeExample);
	}

	@Override
	public List<Employee> SelectByPhone(String phone) {
		EmployeeExample employeeExample = new EmployeeExample();
		Criteria criteria = employeeExample.createCriteria();
		criteria.andPhoneEqualTo(phone);
		return employeeMapper.selectByExample(employeeExample);
	}

}
