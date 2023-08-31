package com.monstar.books.mypage.dao;

import java.util.ArrayList;
import java.util.List;

import com.monstar.books.adorder.dto.AdOrderDto;
import com.monstar.books.mypage.dto.MyOrderDto;

public interface MyOrderDao {
	
	public ArrayList<MyOrderDto> getDeliverStatus(String memberId);
	
	public int getOrderCount(String memberId);
	
	public List<AdOrderDto> getorderDetail(int orderNo);		//주문 상세페이지 주문정보
	
	public List<AdOrderDto> getpaymentDetail(int orderNo);		//주문 상세페이지 결제정보
	
	public List<AdOrderDto> getproductDetail(int orderNo);  //주문 상세페이지 상품정보
	

}
