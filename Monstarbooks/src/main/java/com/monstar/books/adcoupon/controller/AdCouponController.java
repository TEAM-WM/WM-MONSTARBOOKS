package com.monstar.books.adcoupon.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.adcoupon.service.AdCouponListService;
import com.monstar.books.adcoupon.service.AdCouponRegisterService;
import com.monstar.books.adcoupon.service.AdCouponService;
import com.monstar.books.adcoupon.service.AdCouponStatusUpdateService;
import com.monstar.books.vopage.SearchVo;

@Controller
public class AdCouponController {

	AdCouponService adcouponservice;

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/admin/coupon/list")
	public String adcouponList(HttpServletRequest request, Model model, SearchVo searchvo) {

		System.out.println("adcouponList 호출");

		model.addAttribute("request", request);
		model.addAttribute("SearchVo", searchvo);

		adcouponservice = new AdCouponListService(sqlSession);
		adcouponservice.execute(model);

		return "admin/coupon/list";
	}

	@RequestMapping("admin/coupon/updatecouponStatus")
	public String adcouponUpdate(HttpServletRequest request, Model model) {
		System.out.println("adcouponUpdate 호출");

		model.addAttribute("request", request);

		adcouponservice = new AdCouponStatusUpdateService(sqlSession);
		adcouponservice.execute(model);

		return "redirect:/admin/coupon/list";
	}
	
	@RequestMapping("admin/coupon/register_view")
	public String adcouponRegister_view() {
		System.out.println("register_view호출");
		return "admin/coupon/register_view";
	}
	
	@RequestMapping("admin/coupon/register")
	public String adcouponRegister(HttpServletRequest request, Model model) {
		System.out.println("adcouponRegister 호출");
		
		model.addAttribute("request",request);
		
		adcouponservice = new AdCouponRegisterService(sqlSession);
		adcouponservice.execute(model);
		
		return "redirect:/admin/coupon/list";
		
	}

}
