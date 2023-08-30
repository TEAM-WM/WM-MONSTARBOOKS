package com.monstar.books.booklist.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BookDetailDto {
	private int bookno;
	private int bcategoryno;
	private String bimg;
	private String bimgdetail;
	private String bdescription;
	private int bpage;
	private String bsize;
	private String badge;
	private Date bpdate;
	
}