package com.monstar.books.adfaq.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.monstar.books.adfaq.dao.AdFaqDao;
import com.monstar.books.adfaq.dto.AdFaqDto;

public class AdFaqDetailServiceList implements AdFaqService {
	private SqlSession sqlSession;
	
	public AdFaqDetailServiceList(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String faqno = request.getParameter("faqno");
		AdFaqDao dao = sqlSession.getMapper(AdFaqDao.class);
		
		AdFaqDto dto = dao.faqDetail(faqno);
		model.addAttribute("faqDetail",dto);
		
	}

}
