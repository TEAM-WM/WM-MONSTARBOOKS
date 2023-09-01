package com.monstar.books.product.dao;

import java.util.ArrayList;

import com.monstar.books.ex.dto.ExDto;
import com.monstar.books.product.dto.BookDto;


public interface ProductDao {
	
	public ArrayList<BookDto> list();//전체 상품 리스트 호출
	
}//interface 종료