package com.monstar.books.booklist.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.booklist.sevice.BookListService;
import com.monstar.books.booklist.sevice.BookListServiceList;
import com.monstar.books.booklist.sevice.BookDetailServiceList;
import com.monstar.books.booklist.vopage.SearchVO;

@Controller
public class BookListController {
	
	@Autowired
	BookListService service;

	@Autowired
	private SqlSession session;

	// 230818 / 리연 추가
//	@RequestMapping("/ex/sample1")
//	public String list(Model model) {
//
//		System.out.println("샘플입니다.");
//
//		model.addAttribute("sample", "샘플값");
//
//		service = new ExServiceList(session);
//		service.execute(model);
//
//		return "common/ex/sample1";
//
//	}// list 종료
	
	// 230822 / 진성 추가
	// 베스트셀러 리스트
	@RequestMapping("/booklist/bestlist")
	public String bestlist(HttpServletRequest request,SearchVO searchVO, Model model) {
		
		System.out.println("bestlisttttttttttt.");
		
		// 230823 진성 추가
		// paging
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);
		
		service = new BookListServiceList(session);
		service.execute(model);

		return "common/booklist/bestlist";
		
	}// bestlist 종료
	
	// 230823 진성 추가
	// 도서 상세 페이지
	@RequestMapping("/booklist/bookdetail")
	public String bookdetail(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		
		service = new BookDetailServiceList(session);
		service.execute(model);
		
		return "common/booklist/bookdetail";
	}
	
}// class 종료