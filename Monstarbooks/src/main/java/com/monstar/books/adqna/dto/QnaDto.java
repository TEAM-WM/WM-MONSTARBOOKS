package com.monstar.books.adqna.dto;

import java.sql.Date;

import com.monstar.books.member.dto.MemberDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class QnaDto {
	private int qnano; //문의번호
	private int memberno; //회원번호
	private String qcategory; //문의유형
	private String qtitle; //제목
	private String qcontent; //질문내용
	private Date qregdate; //문의날짜
	private String qstatus; //처리상태
	private String qanswer; //답변
	private String qfilesrc; //첨부파일
	private String deleted; //삭제여부
	
	private MemberDto member;
	

}