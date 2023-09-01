package com.monstar.books.cart.dao;

import java.util.ArrayList;
import java.util.Map;

import com.monstar.books.cart.dto.CartDto;


public interface CartDao {

//	장바구니 목록
	public ArrayList<CartDto> cartList();

//	장바구니 수량
	public int cartCnt();

//	수량변경
	public void cntUpdate(String cnt, String cartno);

//	모든 상품의 전체 가격 합계
	public Integer totPrice();

//	장바구니에서 삭제
	public void cartDelete(String i);

}//interface 종료