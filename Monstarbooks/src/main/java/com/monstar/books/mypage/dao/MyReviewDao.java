package com.monstar.books.mypage.dao;

import java.util.List;

import com.monstar.books.member.dto.MemberDto;
import com.monstar.books.mypage.dto.MyReviewDto;

public interface MyReviewDao {

//		리뷰 리스트 페이징 전
//		public List<MyReviewDto> reviewList();
//		리뷰 리스트, 페이징 처리
		List<MyReviewDto> reviewList(int start, int end, String mid);
//		List<MyReviewDto> reviewList(int start, int end, String sk, String Selnum, String mid);
		
//	 	리뷰 전체 리스트 조회
		public int selectReviewListTotCount1(String searchKeyword);
		public int selectReviewListTotCount2(String searchKeyword);
		public int selectReviewListTotCount3(String searchKeyword);
		public int selectReviewListTotCount4(String searchKeyword);		
		
//		리뷰 글쓰기 제목(책,책상세,회원,책카테고리,주문 상세정보) 불러오기
		public MyReviewDto bcategories(int bookno, String mid);
//		public MyReviewDto bcategories(String mid, int orderno);
		
//		리뷰 글 쓰기
//		로그인세션 처리 후 글쓰기
		public void reviewInsert(int bookno, Integer no, String rtitle, String rcontent, String rstar,
		String refilesrc);
		
//		public void reviewInsert(int bookno, int memberno, String rtitle, String rcontent, String rstar, String refilesrc,
//				String mid);
		
//		아이디를 통해 회원번호 받아오기
		public int getMemberno(String memberId);
		
//		리뷰 상세글 뷰 페이지
		MyReviewDto myReviewView(int reviewno, String mid);
//		public MyReviewDto myReviewView(int reviewNo);
	
//		리뷰 글 수정
//		public void reviewUpdate(int rstar, String rcontent, int reviewno, String refilesrc, String mid);
//		public void reviewUpdate(int rstar, String rcontent, int reviewno, String refilesrc);
		public void reviewUpdate(int rstar, String rcontent, int reviewno, String refilesrc, Integer no);
		
		//멤버 테이블(회원 아이디)
		public List<MemberDto> selectId(String mid);

//		리뷰 글 삭제
		public void reviewdelete(int reviewno);

























//		리뷰 리스트 글 총 개수 조회	
//		public int reviewCnt(int memberno);




		
}
		
	
