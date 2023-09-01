package com.monstar.books.adreview.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReviewDto {
	
	private int reviewno; //리뷰번호 
	private int bookno; //도서번호
	private int memberno; //회원번호
	private String rtitle; //후기제목 
	private String rcontent; //후기내용 
	private Date redate; //작성날짜 
	private String rstar; //별점 
	private String refnlesrc; //사진 
	private String deleted; //삭제여부 
	
	private MemberDto member;
	private BookDto book;
	

}
