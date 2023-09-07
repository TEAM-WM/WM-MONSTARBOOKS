package com.monstar.books.adfaq.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.monstar.books.adfaq.dao.AdFaqDao;
import com.monstar.books.adfaq.dto.AdFaqDto;

public class AdFaqUpdateServiceList implements AdFaqService {
	
	private SqlSession sqlSession;
	
	public AdFaqUpdateServiceList(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String faqno = request.getParameter("faqno");
		String fquestion = request.getParameter("fquestion");
		String fanswer = request.getParameter("fanswer");
		String fcategory = request.getParameter("fcategory");
		
		System.out.println("faqno : " + faqno);
		System.out.println("fquestion : " + fquestion);
		System.out.println("fanswer : " + fanswer);
		System.out.println("fcategory : " + fcategory);
		
		AdFaqDao dao = sqlSession.getMapper(AdFaqDao.class);
		dao.faqUpdate(faqno,fquestion,fanswer,fcategory);
		
		
	}

}
