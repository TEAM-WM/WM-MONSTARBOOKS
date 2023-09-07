package com.monstar.books.cs.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.monstar.books.adfaq.dto.AdFaqDto;
import com.monstar.books.adfaq.service.AdFaqService;
import com.monstar.books.cs.dao.CsDao;

public class CsFaqListService implements AdFaqService {
	
	
	
	@Autowired
	private SqlSession session;

	// 생성자
	public CsFaqListService(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>1대1문의 리스트");
		CsDao dao = session.getMapper(CsDao.class);
		Map<String, Object> map = model.asMap();
		
		// 맵에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String code = request.getParameter("code");
		String searchword = request.getParameter("word"); 
		if(searchword==null || searchword.equals("")) {
			searchword="";
		}
		if(code==null || code.equals("")) {
			code="0";
		}
		System.out.println(code);
		String cateName="";
		if(code.equals("0")) {
			cateName="0";
		}else if(code.equals("1")) {
			cateName="반품/교환/환불";
		}else if(code.equals("2")) {
			cateName="주문취소/변경";
		}else if(code.equals("3")) {
			cateName="배송/수령일 안내";
		}
		ArrayList<AdFaqDto> dto = null;
		if(cateName.equals("0")) {
			dto= dao.csFaqAllList(searchword);
			model.addAttribute("word", searchword);
		}else {
			dto= dao.csFaqList(cateName);
		}
		System.out.println("카테고리 명 : "+cateName);
		
		model.addAttribute("code",code);
		model.addAttribute("cateName",cateName);
		model.addAttribute("dto",dto);
	}// override method
}//class