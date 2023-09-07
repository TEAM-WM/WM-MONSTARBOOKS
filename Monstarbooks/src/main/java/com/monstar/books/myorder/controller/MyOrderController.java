package com.monstar.books.myorder.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.myorder.service.MyOrderDetailService;
import com.monstar.books.myorder.service.MyOrderListService;
import com.monstar.books.mypage.service.MyPageService;
import com.monstar.books.mypage.vopage.SearchVO;


@Controller
public class MyOrderController {
	MyPageService service;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("myprofile/myprofile_order")
	public String orderlist(HttpServletRequest request, Model model, SearchVO searchvo) {
		
		model.addAttribute("request",request);
		model.addAttribute("SearchVo",searchvo);
		
		service=new MyOrderListService(sqlSession);
		service.execute(model);
		
		
		return "common/myprofile/myprofile_order";
	}
	
	@RequestMapping("myprofile/myprofile_orderdetail")
	public String orderdetail(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		
		service=new MyOrderDetailService(sqlSession);
		service.execute(model);
		
		return "common/myprofile/myprofile_orderdetail";
	}
	
	
}
