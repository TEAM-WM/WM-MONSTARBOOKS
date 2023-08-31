package com.monstar.books.mypage.dto;

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
public class BookCategoryDto {
	private int bcategoryno;
	private String bcategory1;
	private String bcategory2;
	
}