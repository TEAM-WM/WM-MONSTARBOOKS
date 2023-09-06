package com.monstar.books.cart.dao;

import java.util.ArrayList;
import java.util.List;

import com.monstar.books.cart.dto.CartDto;


public interface CartDao {

//	장바구니 목록
	public ArrayList<CartDto> cartList();

//	장바구니 전체 수
	public int cartCnt();
	
//	장바구니 전체 수 * 한권당 수량
	public int cartTotCnt();

//	수량변경
	public void cntUpdate(String cnt, String cartno);

//	모든 상품의 전체 가격 합계
	public Integer totPrice();

//	장바구니에서 삭제
	public void cartDelete(String i);
	
//	선택상품만 주문
	public ArrayList<CartDto> cartSelList(List<String> chArr);
	
//	선택상품의 금액 합계
	public Integer seltTotPrice(List<String> chArr);
	
//	주문상품의 수
	public int cartSelCnt(List<String> chArr);



}//interface 종료