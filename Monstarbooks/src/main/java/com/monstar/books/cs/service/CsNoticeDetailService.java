package com.monstar.books.cs.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.monstar.books.adfaq.service.AdFaqService;
import com.monstar.books.adnotice.dto.AdNoticeDto;
import com.monstar.books.cs.dao.CsDao;

public class CsNoticeDetailService implements AdFaqService {
	@Autowired
	private SqlSession session;

	// 생성자
	public CsNoticeDetailService(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>공지사항 디테일");
		CsDao dao = session.getMapper(CsDao.class);
		Map<String, Object> map = model.asMap();
		
		// 맵에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int no = Integer.parseInt(request.getParameter("no"));
		AdNoticeDto dto = dao.csNoticeDetail(no);
		AdNoticeDto dtoNext = dao.csNoticeMove(no);
		System.out.println(dtoNext.getLasttitle());
		
		//리턴 받은 해당 글(dto)을 model에 적재
		model.addAttribute("dto",dto);
		model.addAttribute("move",dtoNext);
	}// override method
}//class