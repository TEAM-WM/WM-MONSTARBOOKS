package com.monstar.books.adnotice.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class AdNoticeDto {
	
	private int noticeno;		// 공지 글 번호
	private String ntitle;		// 공지 글 제목
	private String ncontent;	// 공지 글 내용
	private String nwriter;		// 공지 글 작성자
	private Date nregdate;		// 공지 글 작성날짜
	private String nfilesrc;	// 공지 글의 첨부파일
	private String deleted;		// 공지 글의 삭제여부
	private int memberno;		// 회원번호
}
