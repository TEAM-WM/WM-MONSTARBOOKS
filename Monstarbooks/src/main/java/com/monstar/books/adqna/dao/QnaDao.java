package com.monstar.books.adqna.dao;

import java.util.ArrayList;

import com.monstar.books.adqna.dto.QnaDto;
import com.monstar.books.adqna.dto.MemberDto;


public interface QnaDao {
	
	public ArrayList<QnaDto> list(int Start,int end);

	public int selectQnatotCount();

	
}//interface 종료