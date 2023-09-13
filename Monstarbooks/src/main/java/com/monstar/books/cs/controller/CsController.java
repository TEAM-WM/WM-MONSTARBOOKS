package com.monstar.books.cs.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.adfaq.service.AdFaqService;
import com.monstar.books.cs.service.CsFaqListService;
import com.monstar.books.cs.service.CsNoticeDetailService;
import com.monstar.books.cs.service.CsNoticeListService;

//230905 리연 추가
@Controller
public class CsController {
	
	AdFaqService faqService;
	
	@Autowired
	private SqlSession session;

	@RequestMapping("/cscenter")
	public String csCenter(Model model,HttpServletRequest request) {
		System.out.println(">>>고객센터 메인페이지.");
		faqService= new CsNoticeListService(session);
		model.addAttribute("request",request);
		faqService.execute(model);
		return "common/cs/center";
	}// list 종료
	
	@RequestMapping("/cscenter/faq")
	public String csCenterFaq(Model model, HttpServletRequest request) {
		System.out.println(">>>고객센터 faq");
		faqService= new CsFaqListService(session);
		model.addAttribute("request",request);
		faqService.execute(model);
		return "common/cs/faq";
	}// faq 종료
	
	@RequestMapping("/cscenter/notice")
	public String csCenterNotice(Model model, HttpServletRequest request) {
		System.out.println(">>>고객센터 공지사항");
		faqService= new CsNoticeListService(session);
		model.addAttribute("request",request);
		faqService.execute(model);
		return "common/cs/notice";
	}// notice 종료
	@RequestMapping("/cscenter/notice/detail")
	public String csCenterNoticeDetail(Model model, HttpServletRequest request) {
		System.out.println(">>>고객센터 공지사항 디테일");
		faqService= new CsNoticeDetailService(session);
		model.addAttribute("request",request);
		faqService.execute(model);
		return "common/cs/noticeDetail";
	}// notice 종료
}// 고객센터