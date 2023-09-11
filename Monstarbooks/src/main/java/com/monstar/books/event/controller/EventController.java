package com.monstar.books.event.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.event.sevice.EventDetailService;
import com.monstar.books.event.sevice.EventService;
import com.monstar.books.event.sevice.EventServiceList;
import com.monstar.books.event.sevice.EventcoupondwonService1;
import com.monstar.books.event.sevice.EventcoupondwonService2;
import com.monstar.books.event.sevice.EventcoupondwonService3;

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
	public String couponlist(Model model) {
		System.out.println("coupon-list");

		
		return "common/event/coupon-list";
	}// coupon-list 종료
	
	@RequestMapping("/common/event/eventcoupondwon1")
	public String eventcoupondwon1(Model model) {
		System.out.println("eventcoupondwon1");

		service = new EventcoupondwonService1(session);
		service.execute(model);
		
		return "redirect:/common/event/coupon-list";
	}// eventcoupondwon1 종료
	
	@RequestMapping("common/event/eventcoupondwon2")
	public String eventcoupondwon2(Model model) {
		System.out.println("eventcoupondwon2");

		service = new EventcoupondwonService2(session);
		service.execute(model);
		
		return "common/event/coupon-list";
	}//	eventcoupondwon2 종료
	@RequestMapping("common/event/eventcoupondwon3")
	public String eventcoupondwon3(Model model) {
		System.out.println("eventcoupondwon3");

		service = new EventcoupondwonService3(session);
		service.execute(model);
		
		return "common/event/coupon-list";
	}//	eventcoupondwon3 종료
}

