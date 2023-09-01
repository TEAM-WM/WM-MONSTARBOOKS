package com.monstar.books.product.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BookDetailDto {
	private int bookno;
	private String bcategoryno;
	private String bimg;
	private String bimgdetail;
	private String bdescription;
	private int bpage;
	private String besize;
	private String badge;
	private String bpdate;
}