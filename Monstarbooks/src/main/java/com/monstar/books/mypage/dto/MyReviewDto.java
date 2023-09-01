package com.monstar.books.mypage.dto;

import java.sql.Timestamp;

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
//230825 [효슬] 마이리뷰
public class MyReviewDto { //m_review member, book, book_category 테이블 조인

	private int reviewno;	//리뷰번호 PK
	private int bookno;		//도서번호 FK
	private int memberno;	//회원번호 FK
	private String rtitle;		//후기제목, 주문한 도서명 불러오기
	private String rcontent;		//후기내용
	private Timestamp regdate;	//작성날짜
	private int rstar;			//별점 1,2,3,4,5
	private String refilesrc;		//사진 
	private String deleted;		//삭제여부 처음 등록 시 no, 삭제 시 yes
	
	private String mid;		// m_member 테이블에 있는 컬럼값 직접 적용
	private MyProfileDto myprofile;	//m_member 테이블
	private BookDto book;				//m_book 테이블
	private BookCategoryDto bookcategory;	//m_book_category 테이블
	
}// Dto 종료





