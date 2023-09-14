package com.monstar.books.booklist.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BookListDto {
	private int bookno;
	private long bisbn;
	private String btitle;
	private String bsubtitle;
	private String bpublisher;
	private String bwriter;
	private String btranslator;
	private Date bpdate;
	private int bprice;
	private int bpricesell;
	private int bdiscount;
	private String bstatus;
	private Date bcdate;
	private Date bmdate;
	private int bstock;
	
	private int ccount;
	
	private BookListDto list;
	private BookDetailDto detail;
	private BookCategoryDto category;
	
	private float starAvg;
	private int reviewCnt;
	
	private int num;
}