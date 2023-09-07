package com.monstar.books.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.monstar.books.cart.sevice.CartDeleteServiceList;
import com.monstar.books.cart.sevice.CartService;
import com.monstar.books.cart.sevice.CartServiceList;
import com.monstar.books.cart.sevice.CntUpdateServiceList;
import com.monstar.books.order.controller.OrderController;
import com.monstar.books.cart.sevice.CartToOrderServiceList;

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

	}// cart 종료
	
	@RequestMapping(method=RequestMethod.POST, value="/cntUpdate")
	public String cntUpdate(HttpServletRequest request,Model model) {
		
		System.out.println("cnt updateeeeeee");
		
		model.addAttribute("request",request);
		service = new CntUpdateServiceList(session);
		service.execute(model);
		
		return "redirect:cart";
	}// cntUpdate 종료
	
	@RequestMapping(method=RequestMethod.POST, value="/cartDelete")
	public String cartDelete(HttpServletRequest request,
			@RequestParam(value = "chbox[]") List<String> chArr, Model model) {
		
		System.out.println("cart deleteeeeeeee");
		
		model.addAttribute("request",request);
		model.addAttribute("chArr",chArr);
		
		service = new CartDeleteServiceList(session);
		service.execute(model);
		
		return "redirect:cart";
		
	}// cartDelete 종료
	
	// 230831 / 진성 추가
	// 선택 상품 주문하기
	@RequestMapping(method=RequestMethod.POST, value="/order")
	public String order(HttpServletRequest request,
			@RequestParam List<String> chk, Model model) {
		
		System.out.println("orderrrrrr");

		model.addAttribute("request",request);
		model.addAttribute("chArr",chk);
		
		service = new CartToOrderServiceList(session);
		service.execute(model);
		
		return "common/order/order";
		
	}// order 종료
	
}// class 종료