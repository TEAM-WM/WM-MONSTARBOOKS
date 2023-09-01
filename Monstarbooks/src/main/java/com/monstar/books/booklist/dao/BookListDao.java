package com.monstar.books.booklist.dao;

import java.util.ArrayList;

import com.monstar.books.booklist.dto.BookListDto;
import com.monstar.books.booklist.dto.BookReviewDto;

public interface BookListDao {
	
	//리스트 불러오기,페이징 전
	//public ArrayList<BestListDto> list();
	//리스트 불러오기,페이징 후
	public ArrayList<BookListDto> list(int rowStart, int rowEnd);
	
	//글의 총갯수 구하기
	public int TotCount();
	
	// 도서 상세 조회
	public BookListDto bookDetail(String bookno);

	// 리뷰 조회
	public ArrayList<BookReviewDto> bookReivew(String bookno);

	// 별점 평균
	public float starAvg(String bookno);

	// 리뷰 전체 수 조회
	public int reviewCnt(String bookno);

	// 별점 차트
	public ArrayList<BookReviewDto> starChart(String bookno);
	
	
}//interface 종료