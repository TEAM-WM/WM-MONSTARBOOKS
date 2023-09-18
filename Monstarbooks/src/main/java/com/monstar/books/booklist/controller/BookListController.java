package com.monstar.books.booklist.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.monstar.books.booklist.sevice.BookDetailServiceList;
import com.monstar.books.booklist.sevice.BookListService;
import com.monstar.books.booklist.sevice.BookListServiceList;
import com.monstar.books.booklist.sevice.CategoryBookListServiceList;
import com.monstar.books.booklist.sevice.GoOrderServiceList;
import com.monstar.books.booklist.sevice.NewBookListServiceList;
import com.monstar.books.booklist.sevice.SearchBookListServiceList;
import com.monstar.books.booklist.sevice.addCartCheckServiceList;
import com.monstar.books.booklist.sevice.addCartServiceList;
import com.monstar.books.booklist.vopage.SearchVO;

@Controller
public class BookListController {
	
	@Autowired
	BookListService service;

	@Autowired
	private SqlSession session;

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
	
	// 새로나온책 리스트
	@RequestMapping("/booklist/new")
	public String newlist(HttpServletRequest request,SearchVO searchVO, Model model) {
		
		System.out.println("새로나온책 리스트");
		
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);
		
		service = new NewBookListServiceList(session);
		service.execute(model);
		
		return "common/booklist/bestlist";	
	}// newlist 종료
	
	// 국내 국외 리스트
	@RequestMapping("/booklist/category")
	public String categorylist(HttpServletRequest request,SearchVO searchVO, Model model) {
		
		System.out.println("국내 or 국외 리스트");
		
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);
		
		service = new CategoryBookListServiceList(session);
		service.execute(model);
		
		return "common/booklist/bestlist";	
	}// categorylist 종료
	
	// 검색
	@RequestMapping("/**/search")
	public String searchKeyword(HttpServletRequest request,SearchVO searchVO, Model model) {
		
		System.out.println("통합 검색");
		
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);
		
		service = new SearchBookListServiceList(session);
		service.execute(model);
		
		return "common/booklist/bestlist";	
	}// search 종료
	
	// 230823 진성 추가
	// 도서 상세 페이지
	@RequestMapping("/booklist/bookdetail")
	public String bookdetail(HttpServletRequest request,SearchVO searchVO, Model model) {
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);
		
		service = new BookDetailServiceList(session);
		service.execute(model);
		
		return "common/booklist/bookdetail";
	}
	// 230825 진성 추가
	// 도서 리뷰 페이징
	@RequestMapping("/booklist/reviewPage")
	public String reviewPage(HttpServletRequest request,SearchVO searchVO, Model model) {
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);
		
		service = new BookDetailServiceList(session);
		service.execute(model);
		
		return "common/booklist/reviewPage";
	}
	// 상세페이지에서 장바구니 추가
	@RequestMapping(method=RequestMethod.POST, value="/addCart")
	public void addCart(HttpServletRequest request,SearchVO searchVO, Model model) {
		
		System.out.println("addCartttttttttttttt.");
		model.addAttribute("request",request);
		
		service = new addCartServiceList(session);
		service.execute(model);
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/addCartCheck")
	public void cartDelete(HttpServletRequest request,
			@RequestParam(value = "chbox[]") List<String> chArr, Model model) {
		
		System.out.println("addCartCheckkkkkkkkkk");
		
		model.addAttribute("request",request);
		model.addAttribute("chArr",chArr);
		
		service = new addCartCheckServiceList(session);
		service.execute(model);
		
//		return "redirect:";
		
	}// list 종료
	
	@RequestMapping(method=RequestMethod.POST, value="/goOrder")
	public String goOrder(HttpServletRequest request,
			@RequestParam String bookno, @RequestParam String ccount, Model model) {
		
		System.out.println("go orderrrrrrrr");
		
		model.addAttribute("request",request);
		model.addAttribute("bookno",bookno);
		model.addAttribute("ccount",ccount);

		service = new GoOrderServiceList(session);
		service.execute(model);
		
		return "common/order/order";
		
	}// list 종료
	
	
}// class 종료