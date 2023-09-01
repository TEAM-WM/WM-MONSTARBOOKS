package com.monstar.books;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	@RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String auth = (String)session.getAttribute("auth");
		Integer no = (Integer) session.getAttribute("memberNumber");
		if(no==null) {
			no=0;
		}
		System.out.println("=============");
		System.out.println("세션에 저장된 아이디값 : "+id);
		System.out.println("세션에 저장된 권한 : "+auth);
		System.out.println("세션에 저장된 회원번호 : "+no);
		System.out.println("=============");
		return "home";
	}//home
}//class