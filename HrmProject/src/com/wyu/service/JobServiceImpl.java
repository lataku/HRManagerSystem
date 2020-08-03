package com.wyu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyu.mapper.JobMapper;
import com.wyu.pojo.Dept;
import com.wyu.pojo.Job;
import com.wyu.pojo.JobExample;
import com.wyu.pojo.JobExample.Criteria;

@Service
public class JobServiceImpl implements JobService {

	@Autowired
	private JobMapper jobMapper;
	
	@Override
	public int addJob(Job job) {
		// TODO Auto-generated method stub
		return jobMapper.insertSelective(job);
	}

	@Override
	public List<Job> selectAllJobs() {
		// TODO Auto-generated method stub
		return jobMapper.selectByExample(new JobExample());
	}

	@Override
	public List<Job> selectJobLike(Job job) {
		// TODO Auto-generated method stub
		JobExample jobExample = new JobExample();
		Criteria criteria = jobExample.createCriteria();
		if(job.getJid() != null) 
		{
			criteria.andJidEqualTo(job.getJid());
		}
		criteria.andJnameLike("%" + job.getJname() + "%");
		jobExample.or();
		return jobMapper.selectByExample(jobExample);
	}

	@Override
	public int updateJob(Job job) {
		return jobMapper.updateByPrimaryKeySelective(job);
	}

	@Override
	public int delteJobById(int jid) {
		// TODO Auto-generated method stub
		return jobMapper.deleteByPrimaryKey(jid);
	}

	@Override
	public List<Job> SelectByjName(String jname) {
		JobExample jobExample = new JobExample();
		Criteria criteria = jobExample.createCriteria();
		criteria.andJnameEqualTo(jname);
		return jobMapper.selectByExample(jobExample);
	}
	

}
