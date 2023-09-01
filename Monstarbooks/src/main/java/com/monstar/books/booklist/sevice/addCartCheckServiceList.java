package com.monstar.books.booklist.sevice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.booklist.dao.BookListDao;
import com.monstar.books.cart.dao.CartDao;

@Service
public class addCartCheckServiceList implements BookListService {

	@Autowired
	private SqlSession session;

	// 생성자
	public addCartCheckServiceList(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>장바구니 추가 신호");
		
		BookListDao dao = session.getMapper(BookListDao.class);
		
		// 230830 진성 추가
		//map 변환, request 추출	
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<String> chArr = (List<String>) map.get("chArr");
		String memberno = request.getParameter("memberno");
		
		for (String i : chArr) {
			Integer booknoCheck = dao.booknoCheck(i);
			if (booknoCheck == null) {
				dao.cartInsert(memberno,i,"1"); //memberno 추후 추가				
			}else {
				dao.cartAddUpdate(memberno,i,"1"); //memberno 추후 추가
			}
		}
		
		
	}// override method

}// class