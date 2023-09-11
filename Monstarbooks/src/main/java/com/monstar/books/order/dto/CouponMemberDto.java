package com.monstar.books.order.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CouponMemberDto {
//	쿠폰 멤버 테이블
	private int cpno;             // 보유쿠폰 번호                        
	private int memberno;         // M_MEMBER 의 memberno 가 들어가야함    
	private int cpno2;            // M_COUPON의 CPNO 가 들어가야함         
	private Date cprdate;         // 쿠폰 다운로드 날짜                     
	private Date cpvalid;         // M_COUPON의 cpvalid가 들어가야함       
	private String cpstatus;      // 쿠폰 사용유무
	
	private CouponDto coupon;
}