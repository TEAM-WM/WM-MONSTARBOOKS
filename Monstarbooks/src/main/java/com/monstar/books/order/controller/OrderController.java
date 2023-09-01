package com.monstar.books.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.monstar.books.cart.sevice.CartService;
import com.monstar.books.cart.sevice.CartServiceList;
import com.monstar.books.order.sevice.OrderService;
import com.monstar.books.order.sevice.OrderServiceList;

@Controller
public class OrderController {
	
	@Autowired
	CartService cservice;
	@Autowired
	OrderService service;

	@Autowired
	private SqlSession session;

	// 230830 / 진성 추가
	// 전체 상품 주문하기
	@RequestMapping(value="/order")
	public String order(Model model) {
		
		System.out.println("orderrrrrrrrrr");
		
		cservice = new CartServiceList(session);
		cservice.execute(model);

		return "common/order/order";
		
	}// bestlist 종료
	
	// 230831 / 진성 추가
	// 선택 상품 주문하기
//	@RequestMapping(method=RequestMethod.POST, value="/ordersel")
//	public String selorder(HttpServletRequest request,
//			@RequestParam(value = "chbox[]") List<String> chArr, Model model) {
//		
//		System.out.println("sel orderrrrrr");
//		
//		model.addAttribute("request",request);
//		model.addAttribute("chArr",chArr);
//		
//		service = new OrderServiceList(session);
//		service.execute(model);
//		
//		return "common/order/order";
//		
//	}// bestlist 종료
	
	
	@RequestMapping("mycoupon")
	public String mycoupon(Model model) {
		
		System.out.println("mycouponnnnnn");
		
//		service = new CartServiceList(session);
//		service.execute(model);
		
		return "common/order/mycoupon";
		
	}// bestlist 종료
	
	
}// class 종료