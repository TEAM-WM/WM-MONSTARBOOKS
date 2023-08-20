package com.monstar.books.ex.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.ex.sevice.ExService;
import com.monstar.books.ex.sevice.ExServiceList;

@Controller
public class ExController {
	
	@Autowired
	ExService service;

	@Autowired
	private SqlSession session;

	@RequestMapping("/ex/sample1")
	public String list(Model model) {

		System.out.println("샘플입니다.");

		model.addAttribute("sample", "샘플값");

		service = new ExServiceList(session);
		service.execute(model);

		return "common/ex/sample1";

	}// list 종료
	
}// class 종료