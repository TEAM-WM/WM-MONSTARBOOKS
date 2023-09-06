package com.monstar.books.order.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.order.dao.OrderDao;
import com.monstar.books.order.dto.OrderDto;

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
		
		System.out.println(">>>주문 완료");
		
//		map 변환, request 추출
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		OrderDao dao = session.getMapper(OrderDao.class);
		
//		String memberno = request.getParameter("memberno");
//		System.out.println("memberno" + memberno);

//		주문,주문상세,배송 테이블 조회
//		ArrayList<OrderDto> dto = dao.orderList(memberno);
		ArrayList<OrderDto> dto = dao.orderDetail();//memberno 추후 추가
		
//		OrderDto dtos = dao.orderList(memberno);//memberno 추후 추가
		OrderDto dtos = dao.orderList();
		
		model.addAttribute("dto",dto);
		model.addAttribute("dtos",dtos);

	}// override method

}// class