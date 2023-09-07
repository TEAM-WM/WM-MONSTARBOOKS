package com.monstar.books.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.monstar.books.cart.sevice.CartService;
import com.monstar.books.cart.sevice.CartServiceList;
import com.monstar.books.order.sevice.OrderInsertServiceList;
import com.monstar.books.order.sevice.OrderService;
import com.monstar.books.order.sevice.OrderServiceList;

@Primary
@Controller
public class OrderController {
	
	@Autowired
	OrderService service;

	@Autowired
	private SqlSession session;
		
	// 보유 쿠폰 확인
	@RequestMapping("mycoupon")
	public String mycoupon(Model model) {
		
		System.out.println("mycouponnnnnn");
		
//		service = new CartServiceList(session);
//		service.execute(model);
		
		return "common/order/mycoupon";
		
	}// mycoupon 종료
	
	// 주문 테이블 insert
	@RequestMapping(method=RequestMethod.POST, value="orderInsert")
	public String orderInsert(HttpServletRequest request,Model model) {
		
		System.out.println("order inserttttttttt");
		
		model.addAttribute("request",request);
		
		service = new OrderInsertServiceList(session);
		service.execute(model);
		
		return "redirect:orderComplete";
	}// orderInsert 종료
	
	// 결제완료 페이지
	@RequestMapping("orderComplete")
	public String orderComplete(HttpServletRequest request,Model model) {
		
		System.out.println("order completeeeeee");
		
		model.addAttribute("request",request);
		
		service = new OrderServiceList(session);
		service.execute(model);
		
		return "common/order/orderComplete";
	}// orderComplete 종료
	
	
}// class 종료