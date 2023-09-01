package com.monstar.books.order.dto;

import java.util.List;

import com.monstar.books.booklist.dto.BookCategoryDto;
import com.monstar.books.booklist.dto.BookDetailDto;
import com.monstar.books.booklist.dto.BookListDto;
import com.monstar.books.booklist.dto.MemberDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDto {
	private int cartno;
	private int memberno;
	private int bookno;
	private int ccount;
	
	private int cnt;
	
	private BookListDto list;
	private BookDetailDto detail;
	private BookCategoryDto category;
	private MemberDto member;
	
	private List<OrderDto> orders;
	
	public String toString() {
		return "OrderDto [orders="+orders+"]";
	}
}