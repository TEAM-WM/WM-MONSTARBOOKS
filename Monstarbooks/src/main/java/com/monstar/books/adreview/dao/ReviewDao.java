package com.monstar.books.adreview.dao;

import java.util.ArrayList;

import com.monstar.books.adreview.dto.ReviewDto;

public interface ReviewDao {
	
	public ArrayList<ReviewDto> review(int Start, int End, String sk, String selNum);

	public void reviewdelete(int reviewno);

	public int selectBoardTotCount1(String searchKeyword);
	public int selectBoardTotCount2(String searchKeyword);
	public int selectBoardTotCount3(String searchKeyword);
	public int selectBoardTotCount4(String searchKeyword);
	
}//interface 종료