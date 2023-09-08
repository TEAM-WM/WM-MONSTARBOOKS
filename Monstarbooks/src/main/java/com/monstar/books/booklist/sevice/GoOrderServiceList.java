package com.monstar.books.booklist.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.booklist.dao.BookListDao;
import com.monstar.books.booklist.dto.BookListDto;
import com.monstar.books.order.dto.CouponDto;

@Service
public class GoOrderServiceList implements BookListService {

	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public GoOrderServiceList(SqlSession session) {
		this.sqlSession = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>바로 주문 신호");
		
		BookListDao dao = sqlSession.getMapper(BookListDao.class);
		
		// 230902 진성 추가
		//map 변환, request 추출	
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

//		// 세션에서 회원 ID 가져오기
        HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("id");
        System.out.println("id :"+memberId);
        
        int memberno = dao.getMemberno(memberId);		
        System.out.println("memberno :"+memberno);
        
        
		String bookno = (String) map.get("bookno");
		String ccount = (String) map.get("ccount");
		System.out.println("bookno : " + bookno);
		
		// 주문 상품 리스트
		ArrayList<BookListDto> dto =  dao.goOrder(bookno);
		
		// 주문 상품의 총 금액
		int totPrice = 0;
		for (BookListDto bookListDto : dto) {
			totPrice = bookListDto.getBpricesell() * Integer.parseInt(ccount);
		}
		
//		보유쿠폰 조회
		ArrayList<CouponDto> cpdto = dao.myCouponCheck(memberno);
		System.out.println(cpdto);
		model.addAttribute("dto",dto);
		model.addAttribute("ccount",ccount);
		model.addAttribute("totPrice",totPrice);
		model.addAttribute("cpdto",cpdto);
		
	}// override method

}// class