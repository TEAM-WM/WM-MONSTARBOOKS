package com.monstar.books.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.mypage.service.MyPageService;
import com.monstar.books.mypage.service.MyProfileDeleteService;
import com.monstar.books.mypage.service.MyProfileDownloadService;
import com.monstar.books.mypage.service.MyProfileListService;
import com.monstar.books.mypage.service.MyProfileUpdateService;

@Controller
public class MyProfileController {
	MyPageService service;

	@Autowired
	private SqlSession sqlSession;
	//230822,23,24 [효슬] 마이페이지 프로필뷰, 삭제, 수정 페이지
	@RequestMapping("common/myprofile/myprofile_list")
	public String list(HttpServletRequest request, Model model) {
		System.out.println("프로필 이미지 뷰 화면입니다.");

		model.addAttribute("request", request);

		service = new MyProfileListService(sqlSession);
		service.execute(model);

		return "common/myprofile/myprofile_list";

	}// 프로필뷰 list 종료
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request,
			Model model) {
		System.out.println("======delete()======");
//		db에 데이터 삭제 toss
		model.addAttribute("request",request);
		service=new MyProfileDeleteService(sqlSession);
		service.execute(model);	
		
		return "redirect:myprofile/myprofile_list";
	}// delete(update) 종료
	
	@RequestMapping("common/myprofile/myprofile_update")
	public String update(HttpServletRequest request, Model model) {
		System.out.println("프로필 이미지 수정합니다.");

		model.addAttribute("request", request);

		service = new MyProfileUpdateService(sqlSession);
		service.execute(model);

//		return "redirect:myprofile_update";
		return "common/myprofile/myprofile_update";

	}// update 종료
	
	@RequestMapping("/download")
	public String download(HttpServletRequest request,HttpServletResponse response,
			Model model) throws Exception {
		System.out.println("프로필 이미지 다운로드, 저장공간 마련");
		
		model.addAttribute("request",request);
		model.addAttribute("response",response);
		service = new MyProfileDownloadService(sqlSession);
		service.execute(model);
		
//		return "myprofile_list?memberno="+memberno;
		return null;
		
	}// 이미지download 종료
	
}// class 종료