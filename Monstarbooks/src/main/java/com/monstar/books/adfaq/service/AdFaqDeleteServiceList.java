package com.monstar.books.adfaq.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.monstar.books.adfaq.dao.AdFaqDao;

public class AdFaqDeleteServiceList implements AdFaqService {
	
	private SqlSession sqlSession;
	
	public AdFaqDeleteServiceList(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>> AdFaqDeleteServiceList");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String faqno = request.getParameter("faqno");
		System.out.println("faqno : " + faqno);
		
		AdFaqDao dao = sqlSession.getMapper(AdFaqDao.class);
		dao.faqDelete(faqno);
		
	}

}
