package com.monstar.books.order.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class DeliveryDto {
//	배송 테이블
	private int deliveryno;
	private int orderno;
	private int memberno;
	private String daddress1;
	private String daddress2;
	private String daddress3;
	private int dzipcode;
	private String dtel;
	private String dname;
}