package com.monstar.books.adnotice.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.adnotice.service.AdNoticeDeleteServiceList;
import com.monstar.books.adnotice.service.AdNoticeDetailServiceList;
import com.monstar.books.adnotice.service.AdNoticeInsertServiceList;
import com.monstar.books.adnotice.service.AdNoticeService;
import com.monstar.books.adnotice.service.AdNoticeServiceList;
import com.monstar.books.adnotice.service.AdNoticeUpdateServiceList;
import com.monstar.books.vopage.SearchVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class AdNoticeController {
	
	AdNoticeService adnoticeService;
	
	@Autowired
	private SqlSession sqlSession;
	
	
	// notice
	@RequestMapping("admin/adnotice/notice")
	public String Notice(HttpServletRequest request, SearchVo searchVo, Model model) {
		
		System.out.println("notice-------------");
		
		model.addAttribute("request",request);
		model.addAttribute("searchVo",searchVo);
		
		// 공지사항 전체 데이터 가져오기
		adnoticeService = new AdNoticeServiceList(sqlSession);
		adnoticeService.execute(model);
		return "admin/adnotice/notice";
	}
	
	
	// noticeInsert
	@RequestMapping("admin/adnotice/noticeInsert")
	public String NoticeInsert() {

		return "admin/adnotice/noticeInsert";
	}
	
	
	// noticeInsert2
	@RequestMapping("admin/adnotice/noticeInsert2")
	public String NoticeInsert2(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		adnoticeService = new AdNoticeInsertServiceList(sqlSession);
		adnoticeService.execute(model);
		
		return "redirect:notice";
	}
	
	
	// noticeDetail
	@RequestMapping("admin/adnotice/noticeDetail")
	public String NoticeDetail(HttpServletRequest request, Model model) {
		
		// 공지사항 조회
		model.addAttribute("request",request);
		adnoticeService = new AdNoticeDetailServiceList(sqlSession);
		adnoticeService.execute(model);
		
		return "admin/adnotice/noticeDetail";
	}
	
	// noticeUpdate
	@RequestMapping("admin/adnotice/noticeUpdate")
	public String NoticeUpdate(HttpServletRequest request, Model model) {
		System.out.println("NoticeUpdate");
		
		// 공지사항 조회
		model.addAttribute("request",request);
		adnoticeService = new AdNoticeDetailServiceList(sqlSession);
		adnoticeService.execute(model);
		
		return "admin/adnotice/noticeUpdate";
	}
	
	
	// noticeUpdate2
	@RequestMapping("admin/adnotice/noticeUpdate2")
	public String NoticeUpdate2(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		String path = "/Users/chajong-geon/git/WM-MONSTARBOOKS/Monstarbooks/src/main/webapp/resources/assets/upload";
		MultipartRequest req = null;
		try {
			req = new MultipartRequest(request, path, 1024*1024*20,
					"utf-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.addAttribute("req",req);
		
		
		// 클릭한 공지의 번호를 가져옴(수정 이후에 수정한 공지의 상세페이지로 이동시키기 위함)
		String a = req.getParameter("noticeno");
 		System.out.println("a:" + a);		// -> 	넘어옴
		
		adnoticeService = new AdNoticeUpdateServiceList(sqlSession);
		adnoticeService.execute(model);
		
		
		
		// 위에서 받아온 a를 통해 수정을 하면 수정한 글의 상세페이지로 이동
		return "redirect:noticeDetail?noticeno="+a;
		
	}
	
	@RequestMapping("admin/adnotice/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("delete");
		
		model.addAttribute("request",request);
		adnoticeService = new AdNoticeDeleteServiceList(sqlSession);
		adnoticeService.execute(model);
		
		return "redirect:notice";
	}
	
	
}
