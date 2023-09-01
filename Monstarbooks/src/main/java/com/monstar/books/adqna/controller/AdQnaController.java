package com.monstar.books.adqna.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.adqna.sevice.QnaService;
import com.monstar.books.adqna.sevice.QnaServiceList;
import com.monstar.books.adqna.vopage.SearchVO;

@Controller
public class AdQnaController {
	
	@Autowired
	QnaService service;

	@Autowired
	private SqlSession session;

	// 230818 / 리연 추가
	// Test
	@RequestMapping("admin/qna/list")
	public String qna(HttpServletRequest request,SearchVO searchVO,Model model) {
		System.out.println("qna");

		model.addAttribute("request", request);
		model.addAttribute("searchVO", searchVO);
		
		
		service = new QnaServiceList(session);
		service.execute(model);

		return "admin/qna/qna";
	}// qna 종료
	@RequestMapping("qnadetail")
	public String qnadetail(HttpServletRequest request,Model model) {
		System.out.println("qna");

		model.addAttribute("request", request);
		service = new QnaServiceList(session);
		service.execute(model);

		return "admin/qna/qnadetail";
	}// qnadeatil 종료

}// class 종료