package com.monstar.books.member.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}// class 종료