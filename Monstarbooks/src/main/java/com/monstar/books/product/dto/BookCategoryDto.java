package com.monstar.books.product.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BookCategoryDto {
	
	private int bcategoryno; //카테고리번호
	private String bcategory1; //상위 카테고리
	private String bcategory2; //하위 카테고리
}