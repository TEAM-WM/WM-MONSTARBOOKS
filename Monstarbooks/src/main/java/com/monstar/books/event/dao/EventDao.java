package com.monstar.books.event.dao;

import java.util.ArrayList;

import com.monstar.books.adbanner.dto.EventDto;
import com.monstar.books.adcoupon.dto.AdCouponDto;

public interface EventDao {

	public EventDto eventdetail(int eventno);

	public ArrayList<AdCouponDto> couponlist();

	public void eventcoupondwon(Integer no, int cpno, String cpcreated, String cpvalid);

	public ArrayList<EventDto> event(int Start, int end, String sk, String selNum);

	public int selectBoardTotCount1(String searchKeyword);
	public int selectBoardTotCount2(String searchKeyword);
	public int selectBoardTotCount3(String searchKeyword);
	public int selectBoardTotCount4(String searchKeyword);

	
}
