package com.monstar.books.adorder.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.monstar.books.adorder.dto.AdOrderDto;

public interface AdOrderDao {

	public ArrayList<AdOrderDto> getOrderList(int start, int end, String sk); // 기본검색

	public ArrayList<AdOrderDto> getOrderListProductName(int start, int end, String sk); // 책 제목으로 검색

	public ArrayList<AdOrderDto> getOrderListMemberId(int start, int end, String sk); // 주문자로 검색
	
	public ArrayList<AdOrderDto> getOrderListAll(int start, int end, String sk); //전체 검색

	public ArrayList<AdOrderDto> getDeliveryStatus(int start, int end, String sk, String orderStatus); // 배송상태 검색

	public int selectBoardTotCountByStatus(String orderStatus); //배송상태로 페이징 카운팅

	public int selectBoardTotCount1(String searchKeyword); // 책 제목으로 검색

	public int selectBoardTotCount2(String searchKeyword); // 주문자(회원id)로 검색
	
	public int selectBoardTotCount3(String searchKeyword); //전체 검색 카운팅

	public int selectBoardTotCount4(String searchKeyword); // 기본검색 없이 검색

	public List<AdOrderDto> getorderDetail(int orderNo); // 주문 상세페이지 주문정보

	public List<AdOrderDto> getpaymentDetail(int orderNo); // 주문 상세페이지 결제정보

	public List<AdOrderDto> getproductDetail(int orderNo); // 주문 상세페이지 상품정보

	public void adupdateOrderStatus(@Param("orderNo") int orderNo, @Param("newStatus") String newStatus);
}