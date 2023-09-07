package com.monstar.books.adfaq.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.adfaq.service.AdFaqDeleteServiceList;
import com.monstar.books.adfaq.service.AdFaqDetailServiceList;
import com.monstar.books.adfaq.service.AdFaqInsertServiceList;
import com.monstar.books.adfaq.service.AdFaqService;
import com.monstar.books.adfaq.service.AdFaqServiceList;
import com.monstar.books.adfaq.service.AdFaqServiceList1;
import com.monstar.books.adfaq.service.AdFaqServiceList2;
import com.monstar.books.adfaq.service.AdFaqServiceList3;
import com.monstar.books.adfaq.service.AdFaqUpdateServiceList;

@Controller
public class AdFaqController {
	
	AdFaqService adfaqService;
	
	@Autowired
	private SqlSession sqlSession;
	
	// faq	, 전체 FAQ 조회
	@RequestMapping("admin/adfaq/faq")
	public String Faq(Model model) {
		
		System.out.println("=== FAQ ===");

		adfaqService = new AdFaqServiceList(sqlSession);
		adfaqService.execute(model);
		
		return "admin/adfaq/faq";
	}
	
	// faq1	, 카테고리가 반품/교환/환불인 FAQ 조회
	@RequestMapping("admin/adfaq/faq1")
	public String Faq1(Model model) {
		System.out.println("=== FAQ1 ===");
		
		adfaqService = new AdFaqServiceList1(sqlSession);
		adfaqService.execute(model);
		
		return "admin/adfaq/faq";
		
	}
	
	// faq2 , 카테고리가 주문취소/변경인 FAQ 조회
	@RequestMapping("admin/adfaq/faq2")
	public String Faq2(Model model) {
		System.out.println("=== FAQ2 ===");
		
		adfaqService = new AdFaqServiceList2(sqlSession);
		adfaqService.execute(model);
		
		return "admin/adfaq/faq";
	}
	
	// faq3 , 카테고리가 배송/수령일 안내인 FAQ 조회
	@RequestMapping("admin/adfaq/faq3")
	public String Faq3(Model model) {
		System.out.println("=== FAQ3 ===");
		
		adfaqService = new AdFaqServiceList3(sqlSession);
		adfaqService.execute(model);
		
		return "admin/adfaq/faq";
	}
	
	// faqInsert
	@RequestMapping("admin/adfaq/faqInsert")
	public String FaqInsert() {
		
		return "admin/adfaq/faqInsert";
	}
	
	// faqInsert2
	@RequestMapping("admin/adfaq/faqInsert2")
	public String FaqInsert2(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		adfaqService = new AdFaqInsertServiceList(sqlSession);
		adfaqService.execute(model);
		
		return "redirect:faq";
	}
	
	// faqUpdate
	@RequestMapping("admin/adfaq/faqUpdate")
	public String FaqUpdate(HttpServletRequest request, Model model) {
		System.out.println("=== faqUpdate ===");
		
		model.addAttribute("request",request);
		adfaqService = new AdFaqDetailServiceList(sqlSession);
		adfaqService.execute(model);
		
		return "admin/adfaq/faqUpdate";
	}
	
	// faqUpdate2
	@RequestMapping("admin/adfaq/faqUpdate2")
	public String FaqUpdate2(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		adfaqService = new AdFaqUpdateServiceList(sqlSession);
		adfaqService.execute(model);
		
		return "redirect:faq";
	}
	
	// faqDelete
	@RequestMapping("admin/adfaq/faqDelete")
	public String FaqDelete(HttpServletRequest request, Model model) {
		System.out.println("=== Delete ===");
		
		model.addAttribute("request",request);
		adfaqService = new AdFaqDeleteServiceList(sqlSession);
		adfaqService.execute(model);
		
		return "redirect:faq";
	}

}
