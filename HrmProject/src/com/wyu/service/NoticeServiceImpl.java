package com.wyu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyu.mapper.NoticeMapper;
import com.wyu.pojo.Notice;
import com.wyu.pojo.NoticeExample;
import com.wyu.pojo.NoticeExample.Criteria;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	@Override
	public int addNotice(Notice notice) {
		// TODO Auto-generated method stub
		return noticeMapper.insertSelective(notice);
	}

	@Override
	public List<Notice> selectAllNotices() {
		// TODO Auto-generated method stub
		return noticeMapper.selectByExampleWithBLOBs(new NoticeExample());
	}

	@Override
	public List<Notice> selectNoticeLike(Notice notice) {
		// TODO Auto-generated method stub
		NoticeExample noticeExample = new NoticeExample();
		Criteria criteria = noticeExample.createCriteria();
		if(null != notice.getId()) {
			criteria.andIdEqualTo(notice.getId());
		}
		criteria.andUsernameLike("%" + notice.getUsername() + "%");
		criteria.andTitleLike("%" + notice.getTitle() + "%");
		criteria.andNameLike("%" + notice.getName() + "%");
		noticeExample.or();
		return noticeMapper.selectByExampleWithBLOBs(noticeExample);
	}

	@Override
	public int updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		return noticeMapper.updateByPrimaryKeySelective(notice);
	}

	@Override
	public int delteNoticeById(int id) {
		// TODO Auto-generated method stub
		return noticeMapper.deleteByPrimaryKey(id);
	}

}
