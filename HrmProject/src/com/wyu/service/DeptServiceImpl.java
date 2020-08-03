package com.wyu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyu.mapper.DeptMapper;
import com.wyu.pojo.Dept;
import com.wyu.pojo.DeptExample;
import com.wyu.pojo.DeptExample.Criteria;

@Service
public class DeptServiceImpl implements DeptService {

	@Autowired
	private DeptMapper deptMapper;
	
	@Override
	public int addDept(Dept dept) {
		return deptMapper.insertSelective(dept);
	}

	@Override
	public List<Dept> selectAllDepts() {
		// TODO Auto-generated method stub
		return deptMapper.selectByExample(new DeptExample());
	}

	@Override
	public List<Dept> selectDeptLike(Dept dept) {
		DeptExample deptExample = new DeptExample();
		Criteria criteria = deptExample.createCriteria();
		if(dept.getDid() != null) 
		{
			criteria.andDidEqualTo(dept.getDid());
		}
		criteria.andDnameLike("%" + dept.getDname() + "%");
		deptExample.or();
		return deptMapper.selectByExample(deptExample);
	}

	@Override
	public int updateDept(Dept dept) {
		return deptMapper.updateByPrimaryKeySelective(dept);
	}

	@Override
	public int delteDeptById(int did) {
		// TODO Auto-generated method stub
		return deptMapper.deleteByPrimaryKey(did);
	}

	@Override
	public List<Dept> SelectBydName(String dname) {
		DeptExample deptExample = new DeptExample();
		Criteria criteria = deptExample.createCriteria();
		criteria.andDnameEqualTo(dname);
		return deptMapper.selectByExample(deptExample);
	}

}
