package com.monstar.books.adreview.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BookDto{
	private int bookno; //도서번호
	private String btitle; //도서제목
}