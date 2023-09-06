package com.monstar.books.booklist.dao;

import java.util.ArrayList;

import com.monstar.books.booklist.dto.BookListDto;
import com.monstar.books.booklist.dto.BookReviewDto;
import com.monstar.books.cart.dto.CartDto;

public interface BookListDao {
	
	//리스트 불러오기,페이징 전
	//public ArrayList<BestListDto> list();
	//리스트 불러오기,페이징 후
	public ArrayList<BookListDto> list(int rowStart, int rowEnd);
	
	// 상품리스트의 별점 평균, 리뷰수
//	public ArrayList<BookReviewDto> starAvgReCnt(int bookno);
	
	//리스트 총갯수 구하기
	public int TotCount();
	
	// 도서 상세 조회
	public BookListDto bookDetail(String bookno);

	// 리뷰 조회, 페이징 전
	//public ArrayList<BookReviewDto> bookReivew(String bookno);
	// 리뷰 조회, 페이징 후
	public ArrayList<BookReviewDto> bookReivew(String bookno, int rowStart, int rowEnd);
	
	// 별점 평균
	public float starAvg(String bookno);

	// 리뷰 전체 수 조회
	public int reviewCnt(String bookno);

	// 별점 차트
	public ArrayList<BookReviewDto> starChart(String bookno);

	// 장바구니 담기
	public void cartInsert(String memberno, String bookno, String cnt);

	// 장바구니의 담긴 책 조회
	public Integer booknoCheck(String bookno);

	// 장바구니에 추가한 책이 기존에 담긴 책일때 수량 수정
	public void cartAddUpdate(String memberno, String bookno, String cnt);

	// 상품리스트 체크박스로 장바구니 추가
	public void cartAddCheck(String i);

	// 상세페이지에서 바로 주문
	public ArrayList<BookListDto> goOrder(String memberno);
	
	
}//interface 종료