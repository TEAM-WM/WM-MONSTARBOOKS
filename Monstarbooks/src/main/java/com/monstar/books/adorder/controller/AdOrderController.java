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
	
	@RequestMapping("adorder/adorderList")
	public String adorderList(HttpServletRequest request, Model model, SearchVo searchVo) {
		
		System.out.println("adorderList 호출");
		
		model.addAttribute("request", request);
		model.addAttribute("SearchVo",searchVo);
		
		adorderservice=new AdOrderListService(sqlSession);
		adorderservice.execute(model);
		
		return "admin/adorder/adorderList";
	}
}
