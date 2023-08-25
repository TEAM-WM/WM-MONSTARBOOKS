package com.monstar.books.mypage.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.mypage.service.MyPageService;
import com.monstar.books.mypage.service.MyReviewListService;

@Controller
public class MyReviewController {
	MyPageService service;
	
	@Autowired
	private SqlSession sqlSession;
	//230824 [효슬] 마이페이지 리뷰 리스트, 쓰기, 수정, 삭제 페이지
	@RequestMapping("common/myreview/myreview_list")
	public String reviewlist(HttpServletRequest request, Model model) {
		System.out.println("프로필 이미지 뷰 화면입니다.");

		model.addAttribute("request", request);

		service = new MyReviewListService(sqlSession);
		service.execute(model);

		return "common/myreview/myreview_list";

	}// 리뷰 list 종료
}
