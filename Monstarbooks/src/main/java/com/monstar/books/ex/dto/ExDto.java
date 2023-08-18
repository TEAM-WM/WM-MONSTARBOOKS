package com.monstar.books.ex.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ExDto {
	private int exno;
	private String extitle;
	private String excontent;
	private Date exregdate;
	private String deleted;
}