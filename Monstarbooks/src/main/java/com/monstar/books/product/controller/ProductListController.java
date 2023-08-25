package com.monstar.books.product.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.ex.sevice.ExService;
import com.monstar.books.ex.sevice.ExServiceList;
import com.monstar.books.product.sevice.ProductListService;
import com.monstar.books.product.sevice.ProductService;

@Controller
public class ProductListController {
	
	@Autowired
	ProductService service;

	@Autowired
	private SqlSession session;

	//상품목록 생성
	@RequestMapping("/admin/product/list")
	public String list(Model model) {

		System.out.println(">>> LIST >>>");

//		model.addAttribute("sample", "샘플값");

		service = new ProductListService(session);
		service.execute(model);

		return "/admin/product/productList";

	}// list 종료
	
//	@RequestMapping("/ex/sample2")
//	public String list2(Model model) {
//
//		System.out.println("샘플입니다.");
//
//		model.addAttribute("sample", "샘플값");
//
//		service = new ExServiceList(session);
//		service.execute(model);
//
//		return "admin/ex/sample1";
//
//	}// list 종료
}// class 종료