package com.monstar.books.mypage.dao;

import java.util.List;

import com.monstar.books.order.dto.CouponMemberDto;

public interface MyCouponDao {

//	회원 보유쿠폰 리스트
	public List<CouponMemberDto> myCoupon(Integer no);


}
		
	
