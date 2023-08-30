package com.monstar.books.mypage.dao;

import java.util.ArrayList;

import com.monstar.books.mypage.dto.MyOrderDto;

public interface MyOrderDao {
	
	public ArrayList<MyOrderDto> getDeliverStatus(String memberId);
	

}
