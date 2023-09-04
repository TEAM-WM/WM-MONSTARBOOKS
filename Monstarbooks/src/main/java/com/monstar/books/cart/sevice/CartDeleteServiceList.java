package com.monstar.books.cart.sevice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.cart.dao.CartDao;

@Service
public class CartDeleteServiceList implements CartService {

	@Autowired
	private SqlSession session;

	// 생성자
	public CartDeleteServiceList(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>장바구니 삭제");
		
//		map 변환
		Map<String, Object> map = model.asMap();
		
//		map에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		List<String> chArr = (List<String>) map.get("chArr");
		
		String cnt = request.getParameter("cnt");
		
		CartDao dao = session.getMapper(CartDao.class);
		
		for (String i : chArr) {
			dao.cartDelete(i); //memberno 추후 추가
		}

	}// override method

}// class