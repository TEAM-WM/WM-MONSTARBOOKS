package com.monstar.books.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.monstar.books.cart.sevice.CartDeleteServiceList;
import com.monstar.books.cart.sevice.CartService;
import com.monstar.books.cart.sevice.CartServiceList;
import com.monstar.books.cart.sevice.CntUpdateServiceList;

@Controller
public class CartController {
	
	@Autowired
	CartService service;

	@Autowired
	private SqlSession session;

	// 230828 / 진성 추가
	// 장바구니
	@RequestMapping("/cart")
	public String cart(Model model) {

		System.out.println("cartttttttttt");

		service = new CartServiceList(session);
		service.execute(model);

		return "common/cart/cart";

	}// list 종료
	
	@RequestMapping(method=RequestMethod.POST, value="/cntUpdate")
	public String cntUpdate(HttpServletRequest request,Model model) {
		
		System.out.println("cnt updateeeeeee");
		
		model.addAttribute("request",request);
		service = new CntUpdateServiceList(session);
		service.execute(model);
		
		return "redirect:cart";
	}// list 종료
	
	@RequestMapping(method=RequestMethod.POST, value="/cartDelete")
	public String cartDelete(HttpServletRequest request,
			@RequestParam(value = "chbox[]") List<String> chArr, Model model) {
		
		System.out.println("cart deleteeeeeeee");
		
		model.addAttribute("request",request);
		model.addAttribute("chArr",chArr);
		
		service = new CartDeleteServiceList(session);
		service.execute(model);
		
		return "redirect:cart";
		
	}// list 종료
	
}// class 종료