package com.monstar.books.adnotice.dao;

import java.util.ArrayList;

import com.monstar.books.adnotice.dto.AdNoticeDto;

public interface AdNoticeDao {
	public ArrayList<AdNoticeDto> notice();
	public AdNoticeDto noticeDetail(String noticeno);
	public void update(String noticeno, String deleted, String ntitle,
			String ncontent);
	public void insert(String ntitle, String ncontent, String nfilesrc);

}