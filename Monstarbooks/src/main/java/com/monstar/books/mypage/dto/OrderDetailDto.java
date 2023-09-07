package com.monstar.books.mypage.dto;

import java.sql.Timestamp;

import com.monstar.books.booklist.dto.BookDetailDto;
import com.monstar.books.member.dto.MemberDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Data
//230905 [효슬] 마이리뷰
public class OrderDetailDto {

	private int orderno;
	private int bookno;
	private int opricesell;
	private int ocount;
	private String orefund_check;
	private Timestamp oregdate;
	
//	private MemberDto member;
//	private BookDto book;
//	private BookDetailDto bookdetail;
//	private MyReviewDto myreview;
//	private BookCategoryDto bookcategory;
	
}
