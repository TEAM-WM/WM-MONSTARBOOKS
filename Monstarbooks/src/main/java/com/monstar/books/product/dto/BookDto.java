package com.monstar.books.product.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BookDto {
	private int bookno; //도서번호
	private int bisbn; //ISBN
	private String btitle; //도서제목
	private String bsubtitle; //도서부제목
	private String bpublisher; //출판사
	private String bwriter; //저자
	private String btranslator; //역자
	private Date bpdate; //출간일
	private int bprice; //정가
	private int bpricesell; //판매가
	private int bdiscount; //할인율
	private String bstatus; //상태(판매중, 품절, 숨김)
	private Date bcdate; //생성일
	private Date bmdate; //수정일
	private int bstock; //재고
	
	private BookDetailDto bookDetailDto;
	private BookCategoryDto bookCategoryDto;
}