package com.monstar.books.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.mypage.service.MyCouponListService;
import com.monstar.books.mypage.service.MyPageService;
import com.monstar.books.mypage.service.MyProfileViewService;
import com.monstar.books.mypage.vopage.SearchVO;

@Controller
public class MyCouponController {
	
	MyPageService service;
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/mycoupon/couponbox")
	public String couponbox(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("마이페이지 쿠폰 메인화면입니다.");
//		데이터 가져오기 작업
		model.addAttribute("request", request);
		model.addAttribute("searchVO", searchVO);
		
		service = new MyCouponListService(sqlSession);
		service.execute(model);
		
		return "common/mycoupon/couponbox";

	}// 쿠폰함 메인 종료

}// class 종료