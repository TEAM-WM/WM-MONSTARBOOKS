package com.monstar.books.booklist.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.booklist.dao.BookListDao;
import com.monstar.books.booklist.dto.BookListDto;

@Service
public class GoOrderServiceList implements BookListService {

	@Autowired
	private SqlSession session;

	// 생성자
	public GoOrderServiceList(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>바로 주문 신호");
		
		BookListDao dao = session.getMapper(BookListDao.class);
		
		// 230902 진성 추가
		//map 변환, request 추출	
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String bookno = (String) map.get("bookno");
		String ccount = (String) map.get("ccount");
		System.out.println(bookno);
		
		// 주문 상품 리스트
		ArrayList<BookListDto> dto =  dao.goOrder(bookno);//memberno 추후 추가
		
		// 주문 상품의 총 금액
		int totPrice = 0;
		for (BookListDto bookListDto : dto) {
			totPrice = bookListDto.getBpricesell() * Integer.parseInt(ccount);
		}
		
		model.addAttribute("dto",dto);
		model.addAttribute("ccount",ccount);
		model.addAttribute("totPrice",totPrice);
		
	}// override method

}// class