package com.monstar.books.cs.dao;

import java.util.ArrayList;

import com.monstar.books.adfaq.dto.AdFaqDto;
import com.monstar.books.adnotice.dto.AdNoticeDto;

public interface CsDao {
	public ArrayList<AdFaqDto> csFaqList(String code);//faq 리스트
	public ArrayList<AdFaqDto> csFaqAllList(String word);// faq 검색 포함 전체출력
	public ArrayList<AdNoticeDto> csNoticeList(int rowStart, int rowEnd,String word);//공지사항 검색 포함 전체 출력
	public int csNoticeCount(String word);//공지사항 총 갯수
	public AdNoticeDto csNoticeDetail(int no);//공지사항 디테일
	public AdNoticeDto csNoticeMove(int no);//공지사항 이전글 다음글
}//csDa