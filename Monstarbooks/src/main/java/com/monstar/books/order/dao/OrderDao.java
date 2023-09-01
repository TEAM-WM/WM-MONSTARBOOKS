package com.monstar.books.order.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.monstar.books.cart.dto.CartDto;

public interface OrderDao {
	
//	선택상품만 주문
	public ArrayList<CartDto> cartSelList(List<String> chArr);
//	Map<String, Object> param
	
//	선택상품의 금액 합계
	public Integer seltTotPrice(List<String> chArr);
	
//	주문상품 수량
	public int cartCnt(List<String> chArr);
	
}//interface 종료