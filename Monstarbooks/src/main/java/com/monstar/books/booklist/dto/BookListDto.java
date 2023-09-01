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
	private String btitle;
	private String bsubtitle;
	private String bwriter;
	private String btranslator;
	private String bpublisher;
	private Date bpdate;
	private int bprice;
	private int bpricesell;
	private int bdiscount;
	private long bisbn;
	private String bstatus;
	private Date bcdate;
	private Date bmdate;
	
	private BookDetailDto detail;
	private BookCategoryDto category;
	
	private float starAvg;
	private int reviewCnt;
}