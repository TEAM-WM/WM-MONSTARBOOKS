package com.monstar.books.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.member.sevice.MemberInsertService;
import com.monstar.books.member.sevice.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;

	@Autowired
	private SqlSession session;

	// 230823 / 리연 추가
	// 로그인 폼
	@RequestMapping("/login")
	public String login() {
		System.out.println(">>>로그인폼");
		return "common/member/login";
	}// list 종료

	// 230824 리연 추가
	// 아이디 비밀번호 찾기 폼
	@RequestMapping("/find")
	public String find() {
		System.out.println(">>>아이디/비밀번호 찾기 폼");
		return "common/member/find";
	}// list 종료

	// 230824 리연 추가
	// 회원가입 폼
	@RequestMapping("/join")
	public String join() {
		System.out.println(">>>회원가입 폼");
		return "common/member/join";
	}// list 종료

	// 회원가입 완료 요청 처리
	@RequestMapping("/join/access")
	public String joinAccess(Model model,HttpServletRequest request) {
		service = new MemberInsertService(session);
		System.out.println(">>>회원가입 요청처리");
		model.addAttribute("request", request);
		service.execute(model);
		return "common/member/joinAccess";
	}
//
//	@RequestMapping("/admin/member")
//	public ModelAndView adminMember(HttpServletRequest request) {
//		ModelAndView mv = new ModelAndView();
//		System.out.println(">>>관리자 멤버 요청처리");
//		mv.setViewName("admin/member/list");
//		service = new MemberInsertService(session);
//		return mv;
//	}
//	// 아이디가 중복확인 기능 : 아이디 존재 여부 요청 처리
//	@RequestMapping("/member/checkid")
//	@ResponseBody
//	public Map<String, Object> checkid(@RequestParam String inputId) {
//		// boolean값 들어있는 Map 객체 리턴
//		return usersService.isExistId(inputId);
//	}
}// class 종료