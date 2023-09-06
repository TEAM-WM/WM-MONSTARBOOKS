package com.monstar.books.order.dto;

import java.util.Date;

import com.monstar.books.booklist.dto.BookCategoryDto;
import com.monstar.books.booklist.dto.BookDetailDto;
import com.monstar.books.booklist.dto.BookListDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDto {
//	주문 테이블
	private int orderno;
	private int memberno;
	private int cpno;
	private int ototalprice;
	private String ostatus;
	private String opay;
	
	private OrderDetailDto odetail;
	private DeliveryDto delivery;
	private CouponDto coupon;
	private BookListDto list;
	private BookDetailDto bdetail;
	private BookCategoryDto category;
	
	private int count;
}