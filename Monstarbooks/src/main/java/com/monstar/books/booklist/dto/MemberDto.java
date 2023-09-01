package com.monstar.books.booklist.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDto {
	private int memberno;
	private String mid;
	private String mpw;
	private Date mbirth;
	private String mname;
	private String memail;
	private String mtel;
	private Date mregdate;
	private String mprofileimg;
	private String mfavorite;
	private String mauthority;
	private String deleted;
	
}