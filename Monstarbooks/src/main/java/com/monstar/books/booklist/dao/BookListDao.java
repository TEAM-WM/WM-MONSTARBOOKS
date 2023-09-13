package com.monstar.books.booklist.dao;

import java.util.ArrayList;

import com.monstar.books.booklist.dto.BookListDto;
import com.monstar.books.booklist.dto.BookReviewDto;
import com.monstar.books.order.dto.CouponDto;

public interface BookListDao {
	
	// 베스트셀러 리스트
	public ArrayList<BookListDto> list(int rowStart, int rowEnd);
	
	// 베스트셀러 총갯수 구하기
	public int BestTotCount();
	
	// 새로나온책 리스트
	public ArrayList<BookListDto> newList(int rowStart, int rowEnd);	
	
	// 새로나온책 총갯수 구하기
	public int NewTotCount();
	
	//국내 or 국외 카테고리별 리스트
	public ArrayList<BookListDto> categoryList(String category1, String category2, int rowStart, int rowEnd);

	//국내 or 국외 카테고리별 총갯수 구하기
	public int categoryTotCount(String category1, String category2);
	
	// 도서 상세 조회
	public BookListDto bookDetail(String bookno);

	// 리뷰 조회
	public ArrayList<BookReviewDto> bookReivew(String bookno, int rowStart, int rowEnd);
	
	// 별점 평균
	public Float starAvg(String bookno);

	// 리뷰 전체 수 조회
	public int reviewCnt(String bookno);

	// 별점 차트
	public ArrayList<BookReviewDto> starChart(String bookno);

	// 장바구니 담기
	public void cartInsert(int memberno, String bookno, String cnt);

	// 장바구니의 담긴 책 조회
	public Integer booknoCheck(String bookno, int memberno);

	// 장바구니에 추가한 책이 기존에 담긴 책일때 수량 수정
	public void cartAddUpdate(int memberno, String bookno, String cnt);

	// 상품리스트 체크박스로 장바구니 추가
	public void cartAddCheck(String i);

	// 상세페이지에서 바로 주문
	public ArrayList<BookListDto> goOrder(String bookno);

	//id로 memberno 조회
	public int getMemberno(String memberId);
	
	//보유쿠폰 조회
	public ArrayList<CouponDto> myCouponCheck(int memberno);

	//보유쿠폰 수량 조회
	public int cpCnt(int memberno);

	
}//interface 종료