package com.monstar.books.order.sevice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.cart.dto.CartDto;
import com.monstar.books.order.dao.OrderDao;

@Service
@Primary
public class OrderServiceList implements OrderService {

	@Autowired
	private SqlSession session;

	// 생성자
	public OrderServiceList(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>주문");
		
////		map 변환
//		Map<String, Object> map = model.asMap();
//		
////		map에서 request 추출
//		HttpServletRequest request = (HttpServletRequest) map.get("request");
//		List<String> chArr = (List<String>) map.get("chArr");
//		
//		String cnt = request.getParameter("cnt");
//		
//		CartDao dao = session.getMapper(CartDao.class);
//		
//		System.out.println(chArr);
//
//		Map<String, Object> param = new HashMap<String, Object>();
//		param.put("chArr",chArr);	
//		
//		ArrayList<CartDto> dto = dao.cartSelList(param);//memberno 추후 추가
//		
//		Integer selTotPrice = dao.seltTotPrice(param); //memberno 추후 추가
//		if (selTotPrice == null) {
//			model.addAttribute("totPrice",0);			
//		}else {
//			model.addAttribute("totPrice",selTotPrice);			
//		}
//		
//		model.addAttribute("dto", dto);
//		model.addAttribute("cnt", cnt);
		
//		map 변환
		Map<String, Object> map = model.asMap();
	
//		map에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		ArrayList<String> chArr = (ArrayList<String>) map.get("chArr");
		
		System.out.println(chArr);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("chArr",chArr);
		
		OrderDao dao = session.getMapper(OrderDao.class);
		ArrayList<CartDto> dto = dao.cartSelList(chArr);
		
		int cnt = dao.cartCnt(chArr); //memberno 추후 추가
		System.out.println(cnt);
		Integer selTotPrice = dao.seltTotPrice(chArr); //memberno 추후 추가
		
		if (selTotPrice == null) {
			model.addAttribute("totPrice",0);			
		}else {
			model.addAttribute("totPrice",selTotPrice);			
		}
		model.addAttribute("dto", dto);
		model.addAttribute("cnt", cnt);


	}// override method

}// class