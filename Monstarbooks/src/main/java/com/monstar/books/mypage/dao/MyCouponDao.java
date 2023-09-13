package com.monstar.books.mypage.dao;

import java.util.List;

import com.monstar.books.order.dto.CouponMemberDto;

public interface MyCouponDao {

//	회원 보유쿠폰 리스트
//	public List<CouponMemberDto> myCoupon(Integer no); //페이징 처리 전	
	public List<CouponMemberDto> myCoupon(int rowStart, int rowEnd, Integer no);


	
// 쿠폰함 리스트 총갯수 구하기
//	public int couponboxTotCount(String mid);
//	public int couponboxTotCount();
	public int couponboxTotCount(Integer no);

}
		
	
