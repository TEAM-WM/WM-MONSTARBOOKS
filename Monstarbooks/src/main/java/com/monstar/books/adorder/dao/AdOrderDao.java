package com.monstar.books.adorder.dao;

import java.util.ArrayList;

import com.monstar.books.adorder.dto.AdOrderDto;

public interface AdOrderDao {
	
	
	public ArrayList<AdOrderDto> getOrderList(int start, int end, String sk, String selNum);

	public int selectBoardTotCount1(String searchKeyword); //책 제목으로 검색

	public int selectBoardTotCount2(String searchKeyword); //주문자(회원id)로 검색

	public int selectBoardTotCount3(String searchKeyword); //책제목+주문자로 검색

	public int selectBoardTotCount4(String searchKeyword);  //조건 없이 검색
	
	//public ArrayList<AdOrderDto> getOrderList(int rowStart, int rowEnd, String searchKeyword, String setNum);

	
	
}
