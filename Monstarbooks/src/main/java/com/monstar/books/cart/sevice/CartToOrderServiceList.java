package com.monstar.books.cart.sevice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.cart.dao.CartDao;
import com.monstar.books.cart.dto.CartDto;
import com.monstar.books.order.dto.CouponDto;

@Service
public class CartToOrderServiceList implements CartService {

	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public CartToOrderServiceList(SqlSession session) {
		this.sqlSession = session;
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
		
		CartDao dao = sqlSession.getMapper(CartDao.class);
		
		// 세션에서 회원 ID 가져오기
        HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("id");
        System.out.println("id :"+memberId);
        
        int memberno = dao.getMemberno(memberId);		
        System.out.println("memberno :"+memberno);
        
		ArrayList<CartDto> dto = dao.cartSelList(memberno,chArr);
		
		// 상품의 수
		int cnt = dao.cartSelCnt(memberno,chArr);
		System.out.println(cnt);

		Integer selTotPrice = dao.seltTotPrice(memberno,chArr);
		
		model.addAttribute("totPrice",selTotPrice);
		model.addAttribute("dto", dto);
		model.addAttribute("cnt", cnt);
		
		//쿠폰 조회
		ArrayList<CouponDto> cpdto = dao.myCouponCheck(memberno);
		
		//보유쿠폰 수량 조회
		int cpCnt = dao.cpCnt(memberno);
        
        model.addAttribute("cpdto",cpdto);
        model.addAttribute("cpCnt",cpCnt);


	}// override method

}// class