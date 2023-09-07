package com.monstar.books.order.dao;

import java.util.ArrayList;

import com.monstar.books.order.dto.CouponDto;
import com.monstar.books.order.dto.OrderDto;

public interface OrderDao {

//	주문 테이블에 추가
	public void orderInsert(int memberno, String usedCpno, String ototalprice, String opay);

//	주문상세 테이블에 추가
	public void orderInsetDetail(String bookno, String opricesell, String ocount);

//	배송 테이블에 추가
	public void deliveryInsert(int memberno, String daddress1, String daddress2, 
			String daddress3, String dzipcode, String dtel, String dname);

//	결제완료되면 장바구니에서 삭제
	public void cartDelete(String bookno, int memberno);
	
//	주문,주문상세,도서,도서디테일,도서 카테고리 테이블 조회
	public ArrayList<OrderDto> orderDetail(int memberno);

//	주문,주문상세,배송 테이블 조회
	public OrderDto orderList(int memberno);

//	id로 memberno 조회
	public int getMemberno(String memberId);

//	보유 쿠폰 조회
	public ArrayList<CouponDto> myCouponCheck(int memberno);

//	쿠폰 사용함으로 업데이트
	public void couponUse(String usedCpno, int memberno);
	
}//interface 종료