package com.monstar.books.adorder.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.monstar.books.adorder.sevice.AdOrderListService;
import com.monstar.books.adorder.sevice.AdOrderService;
import com.monstar.books.vopage.SearchVo;

@Controller
public class AdOrderController {
	
	@Autowired
	AdOrderService adorderservice;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("admin/order/list")
	public String adorderList(HttpServletRequest request, Model model, SearchVo searchvo) {
	    
	    System.out.println("adorderList 호출");
	    
	    model.addAttribute("request", request);
	    model.addAttribute("SearchVo", searchvo);
	    
	    adorderservice = new AdOrderListService(sqlSession);
	    adorderservice.execute(model);
	    
	    
	    return "/admin/order/list"; // 검색 결과를 표시하는 뷰 페이지로 이동
	}
	
	/*
	 * @RequestMapping("/adorder/adorderdetail") public String
	 * adorderdetail(HttpServletRequest request, Model model) {
	 * System.out.println("adorderdetail 호출");
	 * 
	 * model.addAttribute("request",request); adorderservice = new
	 * AdOrderListService(sqlSession); adorderservice.execute(model);
	 * 
	 * return "admin/adorder/orderdetail"; }
	 */


}