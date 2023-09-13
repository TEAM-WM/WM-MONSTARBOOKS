package com.monstar.books.adfaq.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.monstar.books.adfaq.dao.AdFaqDao;

public class AdFaqServiceList2 implements AdFaqService {
	
	private SqlSession sqlSession;
	
	public AdFaqServiceList2(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>> AdFaqServiceList2");
		
		AdFaqDao dao = sqlSession.getMapper(AdFaqDao.class);
		model.addAttribute("faq",dao.faqList2());
		
	}

}
