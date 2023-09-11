package com.monstar.books.product.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.monstar.books.ex.dto.ExDto;
import com.monstar.books.product.dto.BookCategoryDto;
import com.monstar.books.product.dto.BookDto;


public interface ProductDao {
	
//	public ArrayList<BookDto> list(); //전체 상품 리스트 호출 페이징 전
//	public ArrayList<BookDto> list(int rowStart, int rowEnd); //페이징 후
	public int selectBoardTotCount(); //페이징, 전체 등록 상품 수 카운트 
	public ArrayList<BookDto> list(int start, int end, String sk, String selNum); //검색을 위한 파라미터 추가 메소드
	public int selectBoardTotCount1(String searchKeyword); //ISBN 검색
	public int selectBoardTotCount2(String searchKeyword); //도서제목 검색
	public int selectBoardTotCount3(String searchKeyword); //동시
	public int selectBoardTotCount4(String searchKeyword); //검색어 없이 전체 검색
	
//	public ArrayList<BookDto> searchByBookNo(int searchKeyword, int rowStart, int rowEnd); //ISBN으로 검색 후 리스트 호출
//	public ArrayList<BookDto> searchByBookTitle(String searchKeyword, int rowStart, int rowEnd); //도서제목 검색 후 리스트 호출
//	public ArrayList<BookDto> searchNoType(String searchKeyword, int rowStart, int rowEnd); //검색조건 없이 검색 후 리스트 호출
	
	
	public BookDto detail(int bookno); //상품 디테일 진입
	public ArrayList<BookCategoryDto> selectCategory(); //도서카테고리 정보 리스트 불러오기
	
	
	public void insertBook(int bisbn, String btitle, String bsubtitle, 
			String bpublisher, String bwriter, String btranslator, String bpdate,
			int bprice, int bpricesell, int bdiscount, String bstatus, int bstock); //테이블 "도서" 인서트
	public void insertBookDetail(int bcategoryno, String bimg, String bimgdetail, 
			String bdescription, int bpage, String bsize, String badge); //테이블 "도서디테일" 인서트
	
	
	public void updateBook(int bookno, int bisbn, String btitle, String bsubtitle, String bpublisher,
			String bwriter, String btranslator, String bpdate, int bprice, int bpricesell,
			int bdiscount, String bstatus, int bstock); //테이블 "도서" 업데이트
//	public void updateBookDetail(int bookno, int bcategoryno, String bimg, String bimgdetail, 
//			String bdescription, int bpage, String bsize, String badge); //테이블 "도서디테일" 업데이트
	public void updateBookDetail(int bookno, int bcategoryno,  
			String bdescription, int bpage, String bsize, String badge); //테이블 "도서디테일" 업데이트 (이미지 분리)
	public void updateBookDetailImg(int bookno, String bimg, String bimgdetail); //테이블 "도서디테일"에서 이미지만 따로 업데이트(덮어쓰기 적용)

	
	
//	public void deleteBook(int bookno);
//	public void deleteBookDetail();
	
	
	
}//interface 종료