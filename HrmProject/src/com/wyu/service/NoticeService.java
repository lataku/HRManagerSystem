package com.wyu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.wyu.pojo.Notice;

@Service
public interface NoticeService {

	int addNotice(Notice notice);

	List<Notice> selectAllNotices();

	List<Notice> selectNoticeLike(Notice notice);


	int updateNotice(Notice notice);

	int delteNoticeById(int id);

}

