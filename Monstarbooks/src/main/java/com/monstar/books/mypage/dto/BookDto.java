package com.monstar.books.mypage.dto;

import java.sql.Date;

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
public class BookDto {
	
	private int bookno;	//도서번호
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
	
}

