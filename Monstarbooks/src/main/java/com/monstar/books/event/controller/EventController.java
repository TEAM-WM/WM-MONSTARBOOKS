package com.monstar.books.event.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.event.sevice.CouponlistService;
import com.monstar.books.event.sevice.EventDetailService;
import com.monstar.books.event.sevice.EventService;
import com.monstar.books.event.sevice.EventServiceList;
import com.monstar.books.event.sevice.EventcoupondwonService;

@Controller
public class EventController {

	@Autowired
	EventService service;

	@Autowired
	private SqlSession session;

	@RequestMapping("common/event/event")
	public String event(HttpServletRequest request,Model model) {
		System.out.println("event");

		model.addAttribute("request", request);
//		model.addAttribute("searchVO", searchVO);

		service = new EventServiceList(session);
		service.execute(model);
		
		return "common/event/event";
	}// event 종료
	@RequestMapping("common/event/eventdetail")
	public String eventdetail(HttpServletRequest request,Model model) {
		System.out.println("eventdetail");

		model.addAttribute("request", request);

		service = new EventDetailService(session);
		service.execute(model);
		
		return "common/event/eventdetail";
	}// eventdetail 종료
	@RequestMapping("common/event/coupon-list")
	public String couponlist(HttpServletRequest request,Model model) {
		System.out.println("coupon-list");

		model.addAttribute("request", request);
		
		service = new CouponlistService(session);
		service.execute(model);
		
		
		return "common/event/coupon-list";
	}// coupon-list 종료
	
	@RequestMapping("/common/event/eventcoupondwon")
	public String eventcoupondwon(HttpServletRequest request,Model model) {
		System.out.println("eventcoupondwon");

		model.addAttribute("request",request);
		
		service = new EventcoupondwonService(session);
		service.execute(model);
		
		return "redirect:/common/event/coupon-list";
	}// eventcoupondwon1 종료
	
}

