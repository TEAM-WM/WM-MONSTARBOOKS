package com.monstar.books.adevent.dao;

import java.util.ArrayList;

import com.monstar.books.adbanner.dto.EventDto;
import com.monstar.books.adcoupon.dto.AdCouponDto;
import com.monstar.books.adevent.dto.CouponDto;

public interface AdEventDao {

	public ArrayList<EventDto> list();

	public EventDto eventdetail(int eventno);

	public void eventdelete(int eventno);

	public ArrayList<AdCouponDto> couponlist();

	public void eventcoupondwon(Integer no, int cpno, String cpcreated, String cpvalid);




}
