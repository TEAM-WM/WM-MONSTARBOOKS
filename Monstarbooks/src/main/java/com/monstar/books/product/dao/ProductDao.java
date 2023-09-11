package com.monstar.books.product.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.monstar.books.ex.dto.ExDto;
import com.monstar.books.product.dto.BookCategoryDto;
import com.monstar.books.product.dto.BookDto;


public interface ProductDao {
	
//	public ArrayList<BookDto> list();//전체 상품 리스트 호출
	public ArrayList<BookDto> list(int start, int end);
	
	public BookDto detail(int bookno);//상품 디테일 진입
	public ArrayList<BookCategoryDto> selectCategory();//도서카테고리 정보 리스트 불러오기
	
	
	public void insertBook(long bisbn, String btitle, String bsubtitle, 
			String bpublisher, String bwriter, String btranslator, String bpdate,
			int bprice, int bpricesell, int bdiscount, String bstatus, int bstock);//테이블 "도서" 인서트
	public void insertBookDetail(int bcategoryno, String bimg, String bimgdetail, 
			String bdescription, int bpage, String bsize, String badge);//테이블 "도서디테일" 인서트
	
	
	public void updateBook(int bookno, long bisbn, String btitle, String bsubtitle, String bpublisher,
			String bwriter, String btranslator, String bpdate, int bprice, int bpricesell,
			int bdiscount, String bstatus, int bstock);
//	public void updateBookDetail(int bookno, int bcategoryno, String bimg, String bimgdetail, 
//			String bdescription, int bpage, String bsize, String badge);
	public void updateBookDetail(int bookno, int bcategoryno,  
			String bdescription, int bpage, String bsize, String badge);
	public void updateBookDetailImg(int bookno, String bimg, String bimgdetail); //이미지만 따로 업데이트(덮어쓰기)

	public int selectBoardTotCount();
	
//	public void deleteBook(int bookno);
//	public void deleteBookDetail();
	
	
	
}//interface 종료