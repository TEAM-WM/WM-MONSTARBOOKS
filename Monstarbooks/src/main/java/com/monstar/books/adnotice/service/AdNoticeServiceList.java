package com.monstar.books.adnotice.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.monstar.books.adnotice.dao.AdNoticeDao;

public class AdNoticeServiceList implements AdNoticeService {
	private SqlSession sqlSession;
	
	public AdNoticeServiceList(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>> AdNoticeServiceList");
		
		AdNoticeDao dao = sqlSession.getMapper(AdNoticeDao.class);
		model.addAttribute("notice",dao.notice());
		
	}	
}
