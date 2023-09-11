package com.monstar.books.adcoupon.dto;

import java.sql.Date;

import com.monstar.books.adqna.dto.MemberDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CouponMemberDto {
	private int memberno;
	private int cpno;
	private Date cprdate;
	private Date cpvalid;
	private String cpstatus;
	
	private CouponDto coupon;
	private MemberDto member;
	
}
