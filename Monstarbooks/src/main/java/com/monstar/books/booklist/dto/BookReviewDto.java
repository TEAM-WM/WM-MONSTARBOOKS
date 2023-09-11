package com.monstar.books.booklist.dto;

import java.sql.Date;

import com.monstar.books.member.dto.MemberDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BookReviewDto {
	private int reviewno;
	private int bookno;
	private int memberno;
	private String rtitle;
	private String rcontent;
	private Date regdate;
	private int rstar;
	private String refilesrc;
	private String deleted;
	
	private MemberDto member;
	
	private int starCnt;
//	private float starAvg;
//	private int reviewCnt;
	
}