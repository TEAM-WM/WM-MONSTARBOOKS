package com.monstar.books.adorder.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.adorder.sevice.AdOrderDetailService;
import com.monstar.books.adorder.sevice.AdOrderListService;
import com.monstar.books.adorder.sevice.AdOrderService;
import com.monstar.books.adorder.sevice.AdupdateOrderStatusService;
import com.monstar.books.vopage.SearchVo;

@Controller
public class AdOrderController {
	//=====230915 리연 추가
	String currentPage = "/admin/order"; 

	AdOrderService adorderservice;

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/admin/order/list")
	public String adorderList(HttpServletRequest request, Model model, SearchVo searchvo) {
		model.addAttribute("currentPage",currentPage);
		System.out.println("adorderList 호출");

		model.addAttribute("request", request);
		model.addAttribute("SearchVo", searchvo);

		adorderservice = new AdOrderListService(sqlSession);
		adorderservice.execute(model);

		return "admin/order/list"; // 검색 결과를 표시하는 뷰 페이지로 이동
	}// 주문관리목록

	@RequestMapping("admin/order/detail")
	public String adorderdetail(HttpServletRequest request, Model model) {
		model.addAttribute("currentPage",currentPage);
		System.out.println("adorderdetail 호출");

		model.addAttribute("request", request);

		adorderservice = new AdOrderDetailService(sqlSession);
		adorderservice.execute(model);

		return "admin/order/detail";
	}//주문관리 상세
	
	@RequestMapping("/admin/order/adupdateOrderStatus") // 주문 상황 업데이트
	public String adupdateOrderStatus(HttpServletRequest request, Model model) {
	    System.out.println("adupdateOrderStatus 호출");
	    
	    model.addAttribute("request", request);

	    // adupdateOrderStatusService 생성
	    adorderservice = new AdupdateOrderStatusService(sqlSession);

	    // execute 메소드에 orderNo와 newStatus를 전달
	    adorderservice.execute(model);

	    return "redirect:/admin/order/list";
	}//주문상황 종료
}//class