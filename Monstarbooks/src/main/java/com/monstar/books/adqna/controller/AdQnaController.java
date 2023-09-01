package com.monstar.books.adqna.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.monstar.books.adqna.sevice.QnaService;
import com.monstar.books.adqna.sevice.QnaDeleteService;
import com.monstar.books.adqna.sevice.QnaDetailReplyService;
import com.monstar.books.adqna.sevice.QnaDetailService;
import com.monstar.books.adqna.sevice.QnaServiceList;
import com.monstar.books.adqna.sevice.QnaStatusService;
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
	public String qna(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("qna");

		model.addAttribute("request", request);
		model.addAttribute("searchVO", searchVO);

		service = new QnaServiceList(session);
		service.execute(model);

		return "admin/qna/qna";
	}// qna 종료

	@RequestMapping("admin/qna/qnadetailmodform")
	public String qnadetail(HttpServletRequest request, Model model) {
		System.out.println("qnadetail");

		model.addAttribute("request", request);

		service = new QnaDetailService(session);
		service.execute(model);

		return "admin/qna/qnadetailmodform";
	}// qnadeatil 종료
	
	// 댓글 작성
	@RequestMapping("admin/qna/modifiedReply")
	public String modifiedReply(HttpServletRequest request, Model model) {
		System.out.println("qnadetail");

		model.addAttribute("request", request);

		service = new QnaDetailService(session);
		service.execute(model);

		String qnano = request.getParameter("qnano");
		return "redirect:/admin/qna/modifiedReply?qnano=" + qnano;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "admin/qna/qnadetailview")
	public String qnadetailreply(HttpServletRequest request, Model model) {
		System.out.println("qnadetailreply");

		System.out.println(">>컨트롤러 파라미터값 : " + request.getParameter("qanswer"));
		service = new QnaDetailReplyService(session);
		model.addAttribute("request", request);
		service.execute(model);

		String qnano = request.getParameter("qnano");
		service = new QnaStatusService(session);
		String qstatus = request.getParameter("qstatus");
		model.addAttribute("request", request);
		service.execute(model);
		
		
		return "redirect:/admin/qna/qnadetailview?qnano=" + qnano;

	}
	@RequestMapping("admin/qna/qnadetailview")
	public String qnadetailview(HttpServletRequest request, Model model) {
		System.out.println("qnadetailview");

		model.addAttribute("request", request);

		service = new QnaDetailService(session);
		service.execute(model);

		return "admin/qna/qnadetailview";
	}
	@RequestMapping("admin/qna/qnadelete")
	public String qnadelete(HttpServletRequest request, Model model) {
	    System.out.println("qnadelete");

	    model.addAttribute("request", request);
	    int qnano = Integer.parseInt(request.getParameter("qnano"));

	    service = new QnaDeleteService(session);
	    service.execute(model);

	    // 리스트 화면으로 이동
	    return "redirect:/admin/qna/list"; // 이 부분 수정
	}

}
