package com.monstar.books.myorder.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.mypage.service.MyPageService;
import com.monstar.myorder.service.MyOrderListService;

@Controller
public class MyOrderController {
	MyPageService service;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/common/myprofie/myprofile_order")
	public String orderlist(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		
		service=new MyOrderListService(sqlSession);
		service.execute(model);
		
		
		return "common/myprofile/myprofile_order";
	}
	
	
	
}
