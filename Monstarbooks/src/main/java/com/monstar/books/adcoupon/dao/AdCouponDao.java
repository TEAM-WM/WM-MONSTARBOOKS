package com.monstar.books.adcoupon.dao;

import java.util.ArrayList;

import com.monstar.books.adcoupon.dto.AdCouponDto;

public interface AdCouponDao {

	public ArrayList<AdCouponDto> getCouponList(int rowStart, int rowEnd, String sk);

	public ArrayList<AdCouponDto> selectcpname(int rowStart, int end, String sk);
	
	public ArrayList<AdCouponDto> selectcpdescription(int rowStart, int end, String sk);

    public void adcouponUpdateStatus(int cpno, String newStatus);
	
	public int selectCouponTotCount1(String searchKeyword); // 쿠폰 이름 검색

	public int selectCouponTotCount2(String searchKeyword); // 쿠폰 설명 검색

	public int selectCouponTotCount3(String searchKeyword); // 디폴트 상태

}
