package com.monstar.books.product.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.monstar.books.ex.dto.ExDto;
import com.monstar.books.product.dto.BookCategoryDto;
import com.monstar.books.product.dto.BookDto;


public interface ProductDao {
	
	public ArrayList<BookDto> list();//전체 상품 리스트 호출
	public BookDto detail(String bookno);//상품 디테일 진입
	
	public void insertBook(int bisbn, String btitle, String bsubtitle, 
			String bpublisher, String bwriter, String btranslator, String bpdate,
			int bprice, int bpricesell, int bdiscount, String bstatus, int bstock);//테이블 "도서" 정보 입력
	public ArrayList<BookCategoryDto> selectCategory();//도서카테고리 정보 리스트
//	public void insertBookCategory(String bcategory1, String bcategory2);//도서카테고리 선택 쿼리
//	public void insertBookDetail(BookDto dto);
//	public void insertBookAllData(BookDto dto);
	
	
	
}//interface 종료