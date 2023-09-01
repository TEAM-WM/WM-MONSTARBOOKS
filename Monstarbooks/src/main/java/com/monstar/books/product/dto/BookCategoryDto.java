package com.monstar.books.product.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BookCategoryDto {
	
	private int bcategoryno;
	private String bcategory1;
	private String bcategory2;
}