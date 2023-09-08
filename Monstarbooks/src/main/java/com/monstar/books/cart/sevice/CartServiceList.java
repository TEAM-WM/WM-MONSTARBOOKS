package com.monstar.books.cart.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	private SqlSession sqlSession;

	// 생성자
	public CartServiceList(SqlSession session) {
		this.sqlSession = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>장바구니 신호");
		
		Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
		
        CartDao dao = sqlSession.getMapper(CartDao.class);
        
		// 세션에서 회원 ID 가져오기
        HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("id");
        System.out.println("id :"+memberId);
        
        int memberno = dao.getMemberno(memberId);		
        System.out.println("memberno :"+memberno);
        
		ArrayList<CartDto> dto = dao.cartList(memberno);
		int cnt = dao.cartCnt(memberno); //장바구니 전체 수 
		
		Integer cartCnt = dao.cartTotCnt(memberno); //장바구니 전체 수 *한권당 수량
		Integer totPrice = dao.totPrice(memberno); 
		if (totPrice == null) {
			model.addAttribute("totPrice",0);			
			model.addAttribute("cartCnt", 0);
		}else {
			model.addAttribute("totPrice",totPrice);			
			model.addAttribute("cartCnt", cartCnt);
		}
		model.addAttribute("dto", dto);
		model.addAttribute("cnt", cnt);

	}// override method

}// class