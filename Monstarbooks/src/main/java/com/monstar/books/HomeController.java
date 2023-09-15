package com.monstar.books;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.monstar.books.booklist.dao.BookListDao;
import com.monstar.books.booklist.dto.BookListDto;
import com.monstar.books.booklist.sevice.BookListService;
import com.monstar.books.booklist.sevice.BookListServiceList;
import com.monstar.books.booklist.vopage.SearchVO;

@Controller
public class HomeController {
	@Autowired
	BookListService service;

	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
	public String home(HttpServletRequest request, SearchVO searchVO, Model model) {
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
		BookListDao dao = sqlSession.getMapper(BookListDao.class);

		
		ArrayList<BookListDto> bestList = dao.list(1,11);
		System.out.println("베스트===========");
		for (BookListDto element: bestList) {
		      System.out.println(element);
		    }
		
		ArrayList<BookListDto> newList = dao.newList(1, 10);
		model.addAttribute("best",bestList);
		model.addAttribute("newlist", newList);
		System.out.println("신상===========");
		for (BookListDto element: newList) {
		      System.out.println(element);
		    }
		return "home";
	}//home
	
//	@RequestMapping("/admin")
//	public String admin(Model model,HttpServletRequest request) {
//		
//	    String currentPage = request.getServletPath();; 
//	    System.out.println(currentPage);
//		// 모델에 전달하기
//	    model.addAttribute("currentPage",currentPage);
//		model.addAttribute("");
//		return "admin/dashboard/admin";
//	}//home
}//class