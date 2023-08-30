package com.monstar.books.product.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BookDetailDto {
	private int bookno; //도서번호
	private String bcategoryno; //카테고리번호
	private String bimg; //도서썸네일
	private String bimgdetail; //도서상세이미지
	private String bdescription; //도서설명
	private int bpage; //전체페이지
	private String bsize; //도서크기
	private String bpdate; //출간일
	private String badge; //상품뱃지
}