package com.monstar.books.cs.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//230905 리연 추가
@Controller
public class CsController {
	private SqlSession session;

	@RequestMapping("/cscenter")
	public String csCenter(Model model) {

		System.out.println(">>>고객센터 메인페이지.");

		return "common/cs/center";
	}// list 종료
}// 고객센터