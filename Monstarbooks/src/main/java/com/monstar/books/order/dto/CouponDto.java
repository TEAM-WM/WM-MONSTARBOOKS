package com.monstar.books.order.dto;

import java.util.Date;

import com.monstar.books.booklist.dto.MemberDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CouponDto {
//	쿠폰 테이블
	private int cpno;
	private String cpname;
	private String cpdescription;
	private int cpprice;
	private Date cpcreated;
	private Date cpvalid;
	private String cpstatus;
	
	private CouponMemberDto cpMember;
	private MemberDto member;
}