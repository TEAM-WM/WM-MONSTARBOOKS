package com.monstar.books.adnotice.dao;

import java.util.ArrayList;

import com.monstar.books.adnotice.dto.AdNoticeDto;

public interface AdNoticeDao {
	// notice
	public ArrayList<AdNoticeDto> notice(int start, int end, String sk, String selNum);
	// 공지사항 리스트페이지 검색결과 총 갯수
	public int selectTot1(String searchKeyword);
	public int selectTot2(String searchKeyword);
	public int selectTot3(String searchKeyword);
	public int selectTot4(String searchKeyword);
	
	// noticeInsert
	public void insert(String ntitle, String ncontent, String nfilesrc);
	
	// noticeDetail
	public AdNoticeDto noticeDetail(String noticeno);
	
	// noticeUpdate
	public void update(String noticeno, String ntitle,
			String ncontent, String nfilesrc);
	
	// delete
	public void delete(String noticeno);
	

}