package com.monstar.books.mypage.dao;

import java.util.ArrayList;

import com.monstar.books.mypage.dto.MyProfileDto;

public interface MyProfileDao {
	
	//프로필 메인 (조회)
	public ArrayList<MyProfileDto> list();

	//프로필 이미지 삭제
	public void delete(String smid);

	//프로필 이미지 폼 / 수정 폼
	public MyProfileDto myprofileview(String smid);
	
	//프로필 수정 기능
	public void profileupdate(String smid, String mprofileimg);
//	public void profileupdate(String mid, String mname, String mprofileimg);


}//interface 종료