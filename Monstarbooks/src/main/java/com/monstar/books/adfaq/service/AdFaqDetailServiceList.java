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
		String fcategory = request.getParameter("fcategory");
		AdFaqDao dao = sqlSession.getMapper(AdFaqDao.class);
		
		
		if(fcategory != null) {
			if(fcategory.equals("반품/교환/환불")) {
				String fcategory1 = fcategory;
//				System.out.println("fcategory1 : " + fcategory1);		// 반품/교환/환불
				model.addAttribute("fcategory1","true");
			}else if(fcategory.equals("주문취소/변경")) {
				String fcategory2 = fcategory;
				model.addAttribute("fcategory2","true");
			}else if(fcategory.equals("배송/수령일 안내")) {
				String fcategory3 = fcategory;
				model.addAttribute("fcategory3","true");
			}
		}
		
		
		AdFaqDto dto = dao.faqDetail(faqno);
		model.addAttribute("faqDetail",dto);
		
	}

}
