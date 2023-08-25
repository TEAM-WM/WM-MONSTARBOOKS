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
	private String btitle; //도서제목
	private String bsubtitle; //도서부제목
	private String bwriter; //저자
	private String btranslator; 
	private String bpublisher;
	private Date bpdate;
	private int bprice;
	private int bpricesell;
	private int bdiscount;
	private int bisbn;
	private String bstatus;
	private Date bcdate;
	private Date bmdate;
	private int bstock;
	
	private BookDetailDto bookDeatilDto;
}