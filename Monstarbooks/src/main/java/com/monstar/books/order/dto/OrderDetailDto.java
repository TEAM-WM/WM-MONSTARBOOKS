package com.monstar.books.order.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDetailDto {	
//	주문상세 테이블
	private int orderno;
	private int bookno;
	private int opricesell;
	private int ocount;
	private String orefund_check;
	private Date oregdate;
}