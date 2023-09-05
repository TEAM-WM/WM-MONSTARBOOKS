package com.monstar.books.order.dao;

import java.util.ArrayList;

import com.monstar.books.order.dto.OrderDto;

public interface OrderDao {

//	주문 테이블에 추가
	public void orderInsert(String memberno, String ototalprice, String opay);

//	주문상세 테이블에 추가
	public void orderInsetDetail(String bookno, String opricesell, String ocount);

//	배송 테이블에 추가
	public void deliveryInsert(String memberno, String daddress1, String daddress2, 
			String daddress3, String dzipcode, String dtel, String dname);

//	주문,주문상세,배송,쿠폰 테이블 조회
//	public ArrayList<OrderDto> orderList(String memberno);
	public ArrayList<OrderDto> orderList();
	
}//interface 종료