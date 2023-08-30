package com.monstar.books.product.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.monstar.books.product.sevice.ProductDetailService;
import com.monstar.books.product.sevice.ProductInsertReadyService;
import com.monstar.books.product.sevice.ProductInsertService;
import com.monstar.books.product.sevice.ProductListService;
import com.monstar.books.product.sevice.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService service;

	@Autowired
	private SqlSession session;

	//상품목록 리스트 화면
	@RequestMapping("/admin/product/list")
	public String list(Model model) {

		System.out.println(">>> LIST() >>>");

//		model.addAttribute("sample", "샘플값");

		service = new ProductListService(session);
		service.execute(model);
				
		return "admin/product/productList";

	}// list 종료
	
	
	
	//상품목록 디테일 화면
	@RequestMapping("/admin/product/productDetail")
	public String detail(HttpServletRequest request, Model model) {

		System.out.println(">>> CONTENT DETAIL() >>>");
		
		model.addAttribute("request", request);

		service = new ProductDetailService(session);
		service.execute(model);

		return "admin/product/productDetail";

	}// detail 종료
	
	
	//상품등록 화면
	@RequestMapping("/admin/product/productInsertView")
	public String insert_view(Model model) {
		
		System.out.println(">>> INSERT VIEW() >>>");
		service = new ProductInsertReadyService(session);
		service.execute(model);
				
		return "admin/product/productInsertView";
	}
	
	
	//상품등록 프로세스
	@RequestMapping(method = RequestMethod.POST, value = "/admin/product/productInsertService")
	public String InsertService(Model model, HttpServletRequest request) {

		System.out.println(">>> INSERT SERVICE() >>>");
		
		model.addAttribute("request", request);
		service = new ProductInsertService(session);
		service.execute(model);

		return "redirect:/admin/product/list";
	}
	
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