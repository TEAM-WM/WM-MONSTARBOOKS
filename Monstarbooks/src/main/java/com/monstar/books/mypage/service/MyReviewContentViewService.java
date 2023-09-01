package com.monstar.books.mypage.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyReviewDao;
import com.monstar.books.mypage.dto.BookCategoryDto;
import com.monstar.books.mypage.dto.BookDto;
import com.monstar.books.mypage.dto.MyProfileDto;
import com.monstar.books.mypage.dto.MyReviewDto;

//230828 [효슬] 마이페이지 리뷰 상세글 페이지 서비스 추가
@Primary
@Service
public class MyReviewContentViewService implements MyPageService {
	@Autowired
	private SqlSession sqlSession;
	
	public MyReviewContentViewService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>마이리뷰 상세글 페이지 신호");
		
//		1) 임시 아이디 확인작업
//		String mid="hyottly";		
		
//		map변환
		Map<String, Object> map=model.asMap();
//		map에서 request추출
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		MyReviewDao dao=sqlSession.getMapper(MyReviewDao.class);
//		map.put("mid", mid); //	2) 임시 아이디 확인작업	
//		System.out.println("testmid:"+mid);
		
		
//	    String mid = request.getParameter("mid");	//파라미터값이 불러와지지 않음. 오류뜸
		String bookno = request.getParameter("bookno");
		String bcategory1 = request.getParameter("bcategory1");
		
		MyReviewDto viewdto=dao.myreview_view();		//	3) 임시 아이디 확인작업
		
//		ArrayList<MyProfileDto> pdto = dao.myProfile(mid);
		ArrayList<BookDto> bdto = dao.book(bookno);
		ArrayList<BookCategoryDto> bcdto = dao.bookCategory(bcategory1);
		
		model.addAttribute("myreview_view",viewdto);
//		model.addAttribute("myprofile",pdto);
		model.addAttribute("bcategory", bcdto);
		model.addAttribute("book", bdto);
		


		}
	}