package com.monstar.books.mypage.dao;

import java.util.ArrayList;

import com.monstar.books.mypage.dto.BookCategoryDto;
import com.monstar.books.mypage.dto.BookDto;
import com.monstar.books.mypage.dto.MyProfileDto;
import com.monstar.books.mypage.dto.MyReviewDto;

public interface MyReviewDao {

//		public ArrayList<MyReviewDto> reviewlist(String memberno);//마이리뷰 목록 조회
//		리뷰 리스트, 페이징 처리
		public ArrayList<MyReviewDto> reviewlist(int start, int end, String sk, String selNum);

//	 	리뷰 전체 리스트 조회
		public int selectReviewListTotCount1(String searchKeyword);
		public int selectReviewListTotCount2(String searchKeyword);
		public int selectReviewListTotCount3(String searchKeyword);
		public int selectReviewListTotCount4(String searchKeyword);
		
		
//		리뷰 글 쓰기
//		public void reviewinsert(String rtitle, String rcontent, String refilesrc, String deleted);		
//		글쓰기 string타입(bookno, memberno, rstar)
//		public void reviewinsert(String bookno, String memberno, String rtitle, String rcontent, String rstar, String refilesrc,
//				String deleted, String book, String bookcategory);
//		public MyReviewDto reviewinsert(Integer bookno, Integer memberno, String rtitle, String rcontent, Integer rstar, String refilesrc,
//				String deleted, String book, String bookcategory);
//		글쓰기 integer 타입(bookno, memberno, rstar)
//		public void reviewinsert(Integer bookno, Integer memberno, String rtitle, String rcontent, Integer rstar, String refilesrc,
//				String deleted, String book, String bookcategory);
//		public void reviewinsert(int bookno, int memberno, String rtitle, String rcontent, int rstar, String refilesrc,
//				String deleted);
		
		public void reviewinsert(String rtitle, String rcontent, String refilesrc);
//		public MyReviewDto reviewinsert(String mid);
//		public void reviewinsert(String mid);
		
//		리뷰 상세글 뷰 페이지
//		public MyReviewDto myreview_view(String mid);
		public MyReviewDto myreview_view();
		
//		리뷰 글 수정
//		public void reviewupdate(String reviewno, String memberno, String rtitle, String rcontent, 
//				String rstar, String refilesrc);
		public void reviewupdate(String reviewno, String memberno, String rtitle, 				String rcontent, String rstar, String refilesrc, String book, String bookcategory);
		

		//북 카테고리 테이블
		ArrayList<BookCategoryDto> bookCategory(String bcategoryno1);
//		ArrayList<BookCategoryDto> bookCategory();
		
		//북 테이블
		ArrayList <BookDto> book(String bookno);
//		ArrayList <BookDto> book();

		//멤버 테이블
		public ArrayList<MyProfileDto> myProfile(String mid);








	
}
