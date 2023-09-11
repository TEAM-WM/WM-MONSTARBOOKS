package com.monstar.books.adcoupon.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CouponDto {
	private int cpno;
	private String cpname;
	private String cpdescription;
	private int caprice;
	private Date cpcreated;
	private Date cpvalid;
	private String cpstatus;
}
