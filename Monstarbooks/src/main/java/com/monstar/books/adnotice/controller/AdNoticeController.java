package com.monstar.books.adnotice.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.adnotice.service.AdNoticeDetailServiceList;
import com.monstar.books.adnotice.service.AdNoticeInsertServiceList;
import com.monstar.books.adnotice.service.AdNoticeService;
import com.monstar.books.adnotice.service.AdNoticeServiceList;
import com.monstar.books.adnotice.service.AdNoticeUpdateServiceList;

@Controller
public class AdNoticeController {
	
	AdNoticeService adnoticeService;
	
	@Autowired
	private SqlSession sqlSession;
	
	
	// notice
	@RequestMapping("/admin/adnotice/notice")
	public String Notice(Model model) {
		
		// 공지사항 전체 데이터 가져오기
		adnoticeService = new AdNoticeServiceList(sqlSession);
		adnoticeService.execute(model);
		return "/admin/adnotice/notice";
	}
	
	
	// noticeInsert
	@RequestMapping("/admin/adnotice/noticeInsert")
	public String NoticeInsert() {
		
		return "/admin/adnotice/noticeInsert";
	}
	
	
	// noticeInsert2
	@RequestMapping("/admin/adnotice/noticeInsert2")
	public String noticeInsert2(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		adnoticeService = new AdNoticeInsertServiceList(sqlSession);
		adnoticeService.execute(model);
		
		return "redirect:notice";
	}
	
	
	// noticeDetail
	@RequestMapping("/admin/adnotice/noticeDetail")
	public String NoticeDetail(HttpServletRequest request, Model model) {
		
		// 공지사항 조회
		model.addAttribute("request",request);
		adnoticeService = new AdNoticeDetailServiceList(sqlSession);
		adnoticeService.execute(model);
		
		return "/admin/adnotice/noticeDetail";
	}
	
	
	// noticeUpdate
	@RequestMapping("/admin/adnotice/noticeUpdate")
	public String NoticeUpdate(HttpServletRequest request, Model model) {
		
		// 공지사항 조회
		model.addAttribute("request",request);
		adnoticeService = new AdNoticeDetailServiceList(sqlSession);
		adnoticeService.execute(model);
		
		return "/admin/adnotice/noticeUpdate";
	}
	
	
	// noticeUpdate2
	@RequestMapping("/admin/adnotice/noticeUpdate2")
	public String NoticeUpdate2(HttpServletRequest request, Model model) {
		
//		System.out.println("aaa");
		
		model.addAttribute("request",request);
		adnoticeService = new AdNoticeUpdateServiceList(sqlSession);
		adnoticeService.execute(model);
		
		return "redirect:notice";
		
	}
	
	
}
