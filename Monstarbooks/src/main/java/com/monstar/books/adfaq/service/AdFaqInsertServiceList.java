package com.monstar.books.adfaq.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.monstar.books.adfaq.dao.AdFaqDao;

public class AdFaqInsertServiceList implements AdFaqService {
	private SqlSession sqlSession;
	
	public AdFaqInsertServiceList(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String fquestion = request.getParameter("fquestion");
		String fanswer = request.getParameter("fanswer");
		String fcategory = request.getParameter("fcategory");
		
		System.out.println("fcategory : " + fcategory);
		
		AdFaqDao dao = sqlSession.getMapper(AdFaqDao.class);
		dao.faqInsert(fquestion,fanswer,fcategory);
		
	}
	
	

}
