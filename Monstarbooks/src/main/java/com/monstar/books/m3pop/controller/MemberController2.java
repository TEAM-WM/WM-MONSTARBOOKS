package com.monstar.books.m3pop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.monstar.books.m3pop.dao.MemberDao;
import com.monstar.books.m3pop.dto.MemberDto;
import com.monstar.books.m3pop.service.BServiceInter;
import com.monstar.books.m3pop.service.MemberModifyService;



@Controller
public class MemberController2 {
	
	BServiceInter bServiceInter;
	
	@Autowired
	private SqlSession sqlSession;
	
	

	
	@RequestMapping("/member/content_view")
	public String content_view(HttpServletRequest request, Model model) {
		System.out.println("====content_view()====");
			String url="";	
//		String resultt=loginCheck(request, model);
//		if(resultt.equals("0")) {
//			url= "common/member/loginForm";
//		}else if(resultt.equals("1")){
//			
//		
//		System.out.println("loginCheck : "+loginCheck(request, model));
		//인터페이스 타입으로
		HttpSession session = request.getSession();
		//인터페이스 타입으로
		String mid=(String) session.getAttribute("mid");
		
		MemberDao dao=sqlSession.getMapper(MemberDao.class);
		//dao.upHit(bid);
		//contentView
		
		MemberDto dtos = dao.contentView(mid);
		model.addAttribute("m", dtos);
		
		
		url= "common/member/content_view";
		
//		}
		return url;
	}
	
	@RequestMapping("/member/content_view2")
	public String content_view2(HttpServletRequest request, Model model) {
		System.out.println("====content_view2()====");
				

		HttpSession session = request.getSession();
		//인터페이스 타입으로
		String mid=(String) session.getAttribute("mid");
		//dao.upHit(bid);
		//contentView
		
		return "common/member/content_view2";
	}
	
	@RequestMapping("/member/content_modify")
	public String content_update(HttpServletRequest request, Model model) {
		System.out.println("====content_update()====");
				
		HttpSession session = request.getSession();
		//인터페이스 타입으로
		String mid=(String) session.getAttribute("mid");
		
		//인터페이스 타입으로

		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		MemberDto dtos = dao.contentView(mid);
		model.addAttribute("m", dtos);
		
		
		return "common/member/content_modify";
	}

	@RequestMapping("/member/pwCheckForm")
	public String pwCheckForm(HttpServletRequest request, Model model) {
		System.out.println("====pwCheckForm()====");
				

		  
		return "common/member/pwCheckForm";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/member/modify")
	public String modify(HttpServletRequest request, Model model) throws Exception {
		System.out.println("====modify()====");
				
//		//글수정 update
//		//model에 담아서 toss. 이 모델이 BContentViewService로 전달.
		model.addAttribute("request", request);
		bServiceInter = new MemberModifyService(sqlSession);
		bServiceInter.execute(model);

		
		return "redirect:/member/content_modify";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/member/pwCheck")
	public String pwCheck(HttpServletRequest request, Model model) {
		System.out.println("====pwCheck()====");
				

		HttpSession session = request.getSession();
		//인터페이스 타입으로
		String mid=(String) session.getAttribute("mid");
		//String mid = request.getParameter("mid");
		System.out.println("mid"+mid);
		String mpw = request.getParameter("mpw");
		System.out.println("mpw"+mpw);
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int result=0;
		String password = dao.pwCheck(mid,mpw);
		String url="";
		
		if(password==null) {
			password="";
		}
		//model.addAttribute("member", dtos);
		System.out.println("pw"+password);
		if(password.equals(mpw)) {
			url="redirect:/member/content_modify";
			//return "/member/content_modify";
		}else {
			System.out.println("비밀번호 틀림");
			
			url="redirect:/member/pwCheckForm";
		
			//return "/member/pwCheckForm?result=0";
		}
		System.out.println(url);
		model.addAttribute("result", result);
		return url;
		
		//return "redirect:/member/content_modify";
	}
}
