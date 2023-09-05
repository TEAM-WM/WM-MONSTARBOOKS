package com.monstar.books.cart.sevice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.cart.dao.CartDao;
import com.monstar.books.cart.dto.CartDto;

@Service
public class CartToOrderServiceList implements CartService {

	@Autowired
	private SqlSession session;

	// 생성자
	public CartToOrderServiceList(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>장바구니에서 주문");
		
//		map 변환
		Map<String, Object> map = model.asMap();
	
//		map에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		ArrayList<String> chArr = (ArrayList<String>) map.get("chArr");
		
		System.out.println(chArr);
		
		CartDao dao = session.getMapper(CartDao.class);
		ArrayList<CartDto> dto = dao.cartSelList(chArr);
		
		// 상품의 수
		int cnt = dao.cartSelCnt(chArr); //memberno 추후 추가
		System.out.println(cnt);

		Integer selTotPrice = dao.seltTotPrice(chArr); //memberno 추후 추가
		
		model.addAttribute("totPrice",selTotPrice);
		model.addAttribute("dto", dto);
		model.addAttribute("cnt", cnt);

	}// override method

}// class