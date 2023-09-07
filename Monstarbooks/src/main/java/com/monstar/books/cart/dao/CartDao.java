package com.monstar.books.cart.dao;

import java.util.ArrayList;
import java.util.List;

import com.monstar.books.cart.dto.CartDto;
import com.monstar.books.order.dto.CouponDto;


public interface CartDao {

//	장바구니 목록
	public ArrayList<CartDto> cartList(int memberno);

//	장바구니 전체 수
	public int cartCnt(int memberno);
	
//	장바구니 전체 수 * 한권당 수량
	public Integer cartTotCnt(int memberno);

//	수량변경
	public void cntUpdate(String cnt, String cartno, int memberno);

//	모든 상품의 전체 가격 합계
	public Integer totPrice(int memberno);

//	장바구니에서 삭제
	public void cartDelete(String i, int memberno);
	
//	선택상품만 주문
	public ArrayList<CartDto> cartSelList(int memberno,List<String> list);
	
//	선택상품의 금액 합계
	public Integer seltTotPrice(int memberno,List<String> list);
	
//	주문상품의 수
	public int cartSelCnt(int memberno,List<String> list);

//	id로 memberno 조회
	public int getMemberno(String memberId);

//	보유 쿠폰 조회
	public ArrayList<CouponDto> myCouponCheck(int memberno);


}//interface 종료