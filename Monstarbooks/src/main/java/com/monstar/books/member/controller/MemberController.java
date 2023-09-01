package com.monstar.books.member.controller;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.monstar.books.member.dto.MemberDto;
import com.monstar.books.member.service.MemberIDCheckService;
import com.monstar.books.member.service.MemberInsertService;
import com.monstar.books.member.service.MemberListService;
import com.monstar.books.member.service.MemberLoginProcessService;
import com.monstar.books.member.service.MemberService;
import com.monstar.books.member.service.MemberServiceMap;

//@RequestMapping("/user/*")
@Controller
public class MemberController {

	@Autowired
	MemberService service;
	MemberServiceMap serviceMap;

	@Autowired
	private SqlSession session;

	// 230823 / 리연 추가
	// 로그인폼 요청처리
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		System.out.println(">>>로그인폼");
		// 원래가려던 목적지가 있는지 읽어와 보기
		String url = request.getParameter("url");
		// 가려던 목적지가 없다면
		if (url == null) {
			String cPath = request.getContextPath();
			url = cPath + "/home";// 로그인후 인덱스 페이지로가기
		}

		String savedId = "";
		Cookie[] cooks = request.getCookies();
		if (cooks != null) {
			for (Cookie tmp : cooks) {
				String key = tmp.getName();
				if (key.equals("savedId")) {
					savedId = tmp.getValue();
				}
			}
		}
		request.setAttribute("savedId", savedId);
		request.setAttribute("url", url);
		return "common/member/login";
	}// login 종료

	// 로그인 요청처리
	@RequestMapping("/login/access")
	public String loginAccess(Model model, MemberDto dto, HttpSession httpSession, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(">>로그인 요청처리");
		// 로그인
		String url = request.getParameter("url");
		System.out.println(url);
		if (url == null) {
			String cPath = request.getContextPath();
			url = cPath + "/home";// 로그인후 인덱스 페이지로가기
		}
		String id = request.getParameter("id");
		System.out.println("컨트롤러 아이디값 : "+id);
		
		String encodedUrl = URLEncoder.encode(url);
		model.addAttribute("response", response);
		model.addAttribute("request", request);
		model.addAttribute("httpSession", httpSession);
		model.addAttribute("url", url);
		model.addAttribute("encodedUrl", encodedUrl);

		service = new MemberLoginProcessService(session);
		// service 에서 로그인 할 아이디 비밀번호에 맞는 정보 찾아오는 비즈니스로직 처리를 한다.
		service.execute(model);
		
		return "common/member/loginAccess";
	}// login/access

	// 로그아웃 요청처리
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}// logout

	// 회원가입 - 이용약관
	@RequestMapping("/join/terms")
	public String joinTearms() {
		System.out.println(">>>회원가입 이용약관");
		return "common/member/joinTerms";
	}// join/terms 종료

	// 회원가입 폼
	@RequestMapping("/join")
	public String join() {
		System.out.println(">>>회원가입 폼");
		return "common/member/join";
	}// join 종료

	// 회원가입 완료 요청 처리
	@RequestMapping("/join/access")
	public String joinAccess(Model model, HttpServletRequest request) {
		service = new MemberInsertService(session);
		System.out.println(">>>회원가입 요청처리");
		model.addAttribute("request", request);
		service.execute(model);
		return "common/member/joinAccess";
	}// join/access

	// 아이디 중복확인 기능 : 아이디 존재 여부 요청 처리
	@RequestMapping("/member/checkid")
	@ResponseBody
	public Map<String, Object> checkid(HttpServletRequest request, Model model) {
		// boolean값 들어있는 Map 객체 리턴
		serviceMap = new MemberIDCheckService(session);
		model.addAttribute("id", request.getParameter("inputId"));
		return serviceMap.execute(model);
	}// member/checkid
	
	// 아이디 비밀번호 찾기 폼
	@RequestMapping("/find")
	public String find() {
		System.out.println(">>>아이디/비밀번호 찾기 폼");
		return "common/member/find";
	}// find 종료
	
	
//	@RequestMapping("/find/idPhone")
//	public String idFindPhone() {
//		System.out.println(">>>아이디찾기 전화번호 요청처리");
//		return "common/member/find";
//	}// find/idPhone 종료
//	
//	@RequestMapping("/find/pwEmail")
//	public String pwFindEmail() {
//		System.out.println(">>>비밀번호찾기 이메일 요청처리");
//		return "common/member/find";
//	}// find/pwEmail 종료
//	
//	@RequestMapping("/find/pwPhone")
//	public String pwFindPhone() {
//		System.out.println(">>>비밀번호찾기 전화번호 요청처리");
//		return "common/member/find";
//	}// find/pwPhone 종료

	//====================관리자====================
	@RequestMapping("/admin/member/list")
	public String adminMember(Model model, HttpServletRequest request) {
		System.out.println(">>>관리자 회원 리스트 요청처리");
		service = new MemberListService(session);
		service.execute(model);
		return "admin/member/list";
	}
}// class 종료