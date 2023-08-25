package com.monstar.books.adnotice.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.monstar.books.adnotice.dao.AdNoticeDao;
import com.monstar.books.adnotice.dto.AdNoticeDto;

public class AdNoticeDetailServiceList implements AdNoticeService {
	private SqlSession sqlSession;
	
	public AdNoticeDetailServiceList(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public void execute(Model model) {
		System.out.println(">>> AdNoticeDetailServiceList");
		
		// Map 변환
		Map<String, Object> map = model.asMap();
		// Map에서 Request값 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String noticeno = request.getParameter("noticeno");	
		AdNoticeDao dao = sqlSession.getMapper(AdNoticeDao.class);
		
		AdNoticeDto dto = dao.noticeDetail(noticeno);
		model.addAttribute("noticeDetail",dto);
		
	}

}
