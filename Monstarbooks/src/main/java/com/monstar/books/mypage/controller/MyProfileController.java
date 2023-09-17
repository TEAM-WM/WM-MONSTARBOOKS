package com.monstar.books.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.monstar.books.mypage.service.MyPageService;
import com.monstar.books.mypage.service.MyProfileDeleteService;
import com.monstar.books.mypage.service.MyProfileDownloadService;
import com.monstar.books.mypage.service.MyProfileListService;
import com.monstar.books.mypage.service.MyProfileUpdateService;
import com.monstar.books.mypage.service.MyProfileViewService;

@Controller
public class MyProfileController {
	
	MyPageService service;

	@Autowired
	private SqlSession sqlSession;

	private String mid;
	//230822,23,24 [효슬] 마이페이지 프로필뷰 메인 페이지
	@RequestMapping("myprofile/list")
	public String list(HttpServletRequest request, Model model) {
		System.out.println("프로필 이미지 메인화면입니다.");
//		데이터 가져오기 작업
		model.addAttribute("request", request);
		// 페이지 이름을 모델에 추가
		model.addAttribute("pageName", "list");
		
		service = new MyProfileListService(sqlSession);
		service.execute(model);

		return "common/myprofile/myprofile_list";

	}// 프로필뷰 메인 종료
	
	//230830 [효슬] 마이페이지 프로필(상세) 뷰 페이지	
	@RequestMapping("myprofile/view")
	public String myprofile_view(HttpServletRequest request,Model model) {
		System.out.println("====myprofile_view() 프로필 이미지 조회 화면입니다.====");
//		글수정form toss
		model.addAttribute("request",request);
        // 페이지 이름을 모델에 추가
        model.addAttribute("pageName", "myprofile_view");
        
		service=new MyProfileViewService(sqlSession);
		service.execute(model);
		
		return "common/myprofile/myprofile_view";
	}
	
	//230828 [효슬] 마이페이지 프로필 수정 폼
	@RequestMapping("myprofile/update")	
	public String myprofile_update(HttpServletRequest request, Model model) {
		System.out.println("myprofile_update 프로필 이미지 수정폼입니다.");

		model.addAttribute("request", request);
		// 페이지 이름을 모델에 추가
		model.addAttribute("pageName", "myprofile_update");
		
		service = new MyProfileViewService(sqlSession);
		service.execute(model);

		return "common/myprofile/myprofile_update";

	}// update 수정폼 종료

	//230828,31 [효슬] 마이페이지 프로필 수정 기능
	@RequestMapping(method = RequestMethod.POST,value = "myprofile/profileupdate")
	public String profileupdate(HttpServletRequest request,Model model) {
		System.out.println("========profileupdate()=========");
		//글수정update // Model에 HttpServletRequest 추가
	    model.addAttribute("request", request);
	    // MyProfileUpdateService 인스턴스 생성 및 실행
	    service = new MyProfileUpdateService(sqlSession);
	    service.execute(model);

	    // 수정 후 목록 페이지로 리다이렉트
	    return "redirect:list";
	}
	
	//230828 [효슬] 마이페이지 프로필이미지 삭제 기능
	@RequestMapping("myprofile/delete")
	public String delete(HttpServletRequest request,
			Model model) {
		System.out.println("======delete()======");
//		db에 데이터 삭제 toss
		model.addAttribute("request",request);
		service=new MyProfileDeleteService(sqlSession);
		service.execute(model);	
		
		return "redirect:list";
	}// delete(update) 종료
	
	//230831 [효슬] 마이페이지 프로필이미지 다운로드, 저장공간 기능	
	@RequestMapping("myprofile/download")
	public String download(HttpServletRequest request,HttpServletResponse response,
		Model model) throws Exception {
		System.out.println("프로필 이미지 다운로드, 저장공간 마련");
		
		model.addAttribute("request",request);
		model.addAttribute("response",response);
		service = new MyProfileDownloadService(sqlSession);
		service.execute(model);
		
		return "myprofile_list?mid="+mid;
//		return null;
		
	}// 이미지download 종료
	
}// class 종료