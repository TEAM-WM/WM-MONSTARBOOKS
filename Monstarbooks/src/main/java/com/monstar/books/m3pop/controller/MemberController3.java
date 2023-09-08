package com.monstar.books.m3pop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.monstar.books.m3pop.dao.MemberDao;
import com.monstar.books.m3pop.dto.MemberDto;
import com.monstar.books.m3pop.service.BServiceInter;
import com.monstar.books.m3pop.service.MemberModifyService;

@Controller
public class MemberController3 {

	BServiceInter bServiceInter;

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/mypage/content_view")
	public String content_view(HttpServletRequest request, Model model) {
		System.out.println("====content_view()====");
		String url = "";
//		String resultt=loginCheck(request, model);
//		if(resultt.equals("0")) {
//			url= "common/member/loginForm";
//		}else if(resultt.equals("1")){
//			
//		
//		System.out.println("loginCheck : "+loginCheck(request, model));

		// 인터페이스 타입으로
		HttpSession session = request.getSession();
		// 인터페이스 타입으로
		String mid = (String) session.getAttribute("mid");
		System.out.println(mid);
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		// dao.upHit(bid);
		// contentView

		MemberDto dtos = dao.contentView(mid);
		model.addAttribute("m", dtos);

		url = "common/mypage/content_view";

//		}
		return url;
	}

	@RequestMapping("/mypage/content_modify")
	public String content_update(HttpServletRequest request, Model model) {
		System.out.println("====content_update()====");

		HttpSession session = request.getSession();
		// 인터페이스 타입으로
		String mid = (String) session.getAttribute("id");

		// 인터페이스 타입으로

		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		MemberDto dtos = dao.contentView(mid);
		model.addAttribute("m", dtos);

		return "common/mypage/content_modify";
	}

	@RequestMapping("/mypage/pwCheckForm")
	public String pwCheckForm(HttpServletRequest request, Model model) {
		System.out.println("====pwCheckForm()====");

		return "common/mypage/pwCheckForm";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/mypage/pwCheck")
	public String pwCheck(HttpServletRequest request, Model model) {
		System.out.println("====pwCheck()====");

		HttpSession session = request.getSession();
		// 인터페이스 타입으로
		String mid = (String) session.getAttribute("id");
		// System.out.println("mid"+mid);
		// if(true) return;
		String mpw = request.getParameter("mpw");
		// System.out.println("mpw"+mpw);
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int result = 0;
		MemberDto dto = dao.getData(mid);
		System.out.println(dto);
		boolean isValid = false;
		if (dto != null) {// 아이디는 일치하는 경우(아이디만 일치할수 있다.)
			String encodedPwd = dto.getMpw();
			System.out.println("encodedPwd:" + encodedPwd);
			String inputPwd = request.getParameter("mpw");
			BCryptPasswordEncoder machers = new BCryptPasswordEncoder();
			// DB 비밀번호와 input 비밀번호 비교
			isValid = machers.matches(inputPwd, encodedPwd);
			System.out.println("isValid:" + isValid);
			System.out.println("inputPwd : " + inputPwd);
			System.out.println("암호화 : " + encodedPwd);
			System.out.println(isValid);
		}

		// String password = dao.pwCheck(mid,mpw);
		String url = "";

		// if(password==null) {
		// password="";
		// }
		// model.addAttribute("member", dtos);
		// System.out.println("pw"+password);
		// if(password.equals(mpw)) {
		if (isValid) {// 만일 유효한 정보이면(있다면)
			url = "redirect:/mypage/content_modify";
			// return "/member/content_modify";
		} else {
			System.out.println("비밀번호 틀림");

			url = "redirect:/mypage/pwCheckForm";

			// return "/member/pwCheckForm?result=0";
		}
		System.out.println(url);
		model.addAttribute("result", result);
		return url;

		// return "redirect:/member/content_modify";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/mypage/modify")
	public String modify(HttpServletRequest request, Model model) throws Exception {
		System.out.println("====modify()====");

//		//글수정 update
//		//model에 담아서 toss. 이 모델이 BContentViewService로 전달.
		model.addAttribute("request", request);
		bServiceInter = new MemberModifyService(sqlSession);
		bServiceInter.execute(model);

		return "redirect:/mypage/content_modify";
	}
}