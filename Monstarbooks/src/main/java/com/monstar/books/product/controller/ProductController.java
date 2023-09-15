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
import com.monstar.books.product.sevice.ProductUpdateReadyService;
import com.monstar.books.product.sevice.ProductUpdateService;
import com.monstar.books.product.vopage.SearchVO;


@Controller
public class ProductController {
	//=====230908 리연 추가
	String currentPage = "/admin/product"; 
   
	@Autowired
	ProductService service;

	@Autowired
	private SqlSession session;
	
	//isbn test
	@RequestMapping("/admin/product/isbn")
	public String isbn(Model model, HttpServletRequest request, SearchVO searchVO) {

		System.out.println(">>> ISBN TEST() >>>");
		
		return "admin/product/testISBN";
	}
	
	

	//상품리스트
	@RequestMapping("/admin/product/productlist")
	public String list(Model model, HttpServletRequest request, SearchVO searchVO) {

		System.out.println(">>> LIST() >>>");

		model.addAttribute("request", request);
		model.addAttribute("serchVO", searchVO);
				
		service = new ProductListService(session);
		service.execute(model);
					
		return "admin/product/productList";

	}// list 종료
	
	
	//상품등록 카테고리 준비
	@RequestMapping("/admin/product/productinsertview")
	public String insert_view(Model model) {
		model.addAttribute("currentPage",currentPage);
		System.out.println(">>> INSERT VIEW() >>>");
		
		service = new ProductInsertReadyService(session);
		service.execute(model);
				
		return "admin/product/productInsertView";
	}


	
	//상품등록
	@RequestMapping(method = RequestMethod.POST, value = "/admin/product/productinsert")
	public String insert(Model model, HttpServletRequest request) {

		System.out.println(">>> INSERT() >>>");
				
		model.addAttribute("request", request);
		service = new ProductInsertService(session);
		service.execute(model);

		return "redirect:/admin/product/productlist";
	}
		
	
	//상품디테일
	@RequestMapping("/admin/product/productdetail")
	public String detail(HttpServletRequest request, Model model) {
		model.addAttribute("currentPage",currentPage);
		System.out.println(">>> DETAIL() >>>");
		
		model.addAttribute("request", request);
		service = new ProductDetailService(session);
		service.execute(model);

		return "admin/product/productDetail";

	}// detail 종료
	
		
	
	//상품수정 카테고리 준비
	@RequestMapping("/admin/product/productupdateview")
	public String update_view(Model model, HttpServletRequest request) {
		
		model.addAttribute("currentPage",currentPage);
		System.out.println(">>> UPDATE VIEW() >>>");
		
		model.addAttribute("request", request);
		service = new ProductUpdateReadyService(session);
		service.execute(model);
		
		return "admin/product/productUpdateView";
	}
	
	//상품수정
	@RequestMapping("/admin/product/productupdate")
	public String update(Model model, HttpServletRequest request) {

		System.out.println(">>> UPDATE() >>>");
		
		model.addAttribute("request", request);
		service = new ProductUpdateService(session);
		service.execute(model);

		return "redirect:/admin/product/productlist";
	}
//	
//	//상품상태 변경(=판매중, 품절, 숨김)
//	@RequestMapping("/admin/product/productupdate")
//	public String update(Model model, HttpServletRequest request) {
//
//		System.out.println(">>> UPDATE() >>>");
//		
//		model.addAttribute("request", request);
//		service = new ProductUpdateService(session);
//		service.execute(model);
//
//		return "redirect:/admin/product/productlist";
//	}
//	
	
	
	
	
	
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