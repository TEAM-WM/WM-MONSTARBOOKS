package com.monstar.books.cart.sevice;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.cart.dao.CartDao;
import com.monstar.books.cart.dto.CartDto;

@Primary
@Service
public class CartServiceList implements CartService {

	@Autowired
	private SqlSession session;

	// 생성자
	public CartServiceList(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>장바구니 신호");
		
		CartDao dao = session.getMapper(CartDao.class);
		ArrayList<CartDto> dto = dao.cartList();
		int cnt = dao.cartCnt(); //장바구니 전체 수 //memberno 추후 추가
		int cartCnt = dao.cartTotCnt(); //장바구니 전체 수 * 한권당 수량 //memberno 추후 추가
		Integer totPrice = dao.totPrice(); //memberno 추후 추가
		if (totPrice == null) {
			model.addAttribute("totPrice",0);			
		}else {
			model.addAttribute("totPrice",totPrice);			
		}
		model.addAttribute("dto", dto);
		model.addAttribute("cartCnt", cartCnt);
		model.addAttribute("cnt", cnt);

	}// override method

}// class