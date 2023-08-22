package com.monstar.books.ex.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ExDto {
	private int exno; //번호
	private String extitle; //제목
	private String excontent; // 내용
	private Date exregdate; // 등록날짜
	private String deleted; // 삭제여부
}