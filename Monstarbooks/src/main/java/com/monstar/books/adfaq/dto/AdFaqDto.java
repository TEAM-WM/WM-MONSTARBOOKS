package com.monstar.books.adfaq.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class AdFaqDto {
	
	private int faqno;				// FAQ 글 번호
	private String fquestion;		// FAQ 글 질문
	private String fanswer;			// FAQ 글 답변
	private String fcategory;		// FAQ 글의 카테고리
	private Date fregdate;			// FAQ 등록날짜
	private String deleted;			// FAQ 글의 삭제여부

}
