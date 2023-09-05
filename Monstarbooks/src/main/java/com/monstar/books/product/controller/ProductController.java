package com.monstar.books.product.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Map;

import javax.servlet.AsyncContext;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpUpgradeHandler;
import javax.servlet.http.Part;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.monstar.books.product.sevice.ProductInsertReadyService;
import com.monstar.books.product.sevice.ProductDetailService;
import com.monstar.books.product.sevice.ProductUpdateReadyService;
import com.monstar.books.product.sevice.ProductInsertService;
import com.monstar.books.product.sevice.ProductListService;
import com.monstar.books.product.sevice.ProductService;
import com.monstar.books.product.sevice.ProductUpdateService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService service;

	@Autowired
	private SqlSession session;

	//상품리스트
	@RequestMapping("/admin/product/productlist")
	public String list(Model model) {

		System.out.println(">>> LIST() >>>");

//		model.addAttribute("sample", "샘플값");

		service = new ProductListService(session);
		service.execute(model);
				
		return "admin/product/productList";

	}// list 종료
	
	
	//상품등록 카테고리 준비
	@RequestMapping("/admin/product/productinsertview")
	public String insert_view(Model model) {
		
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

		System.out.println(">>> DETAIL() >>>");
		
		model.addAttribute("request", request);
		service = new ProductDetailService(session);
		service.execute(model);

		return "admin/product/productDetail";

	}// detail 종료
	
		
	
	//상품수정 카테고리 준비
	@RequestMapping("/admin/product/productupdateview")
	public String update_view(Model model, HttpServletRequest request) {
		
		
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