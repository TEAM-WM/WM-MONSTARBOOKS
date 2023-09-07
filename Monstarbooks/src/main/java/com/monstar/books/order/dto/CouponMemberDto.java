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
	private int cpno;
	private int memberno;
	private int cpno2;
	private Date cprdate;
	private Date cpvalid;
	private String cpstatus;
}