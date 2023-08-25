package com.monstar.books.mypage.dao;

import java.util.ArrayList;

import com.monstar.books.mypage.dto.MyProfileDto;

public interface MyProfileDao {
	
	public ArrayList<MyProfileDto> list();
//	public void update(int memberno, String mid, String mname, String mprofileimg);
//	public void update(String memberno,String mprofileimg);
//	public void update(String mprofileimg,String memberno);
	public void update(int memberno, String mprofileimg);
	public void delete(int memberno, String mprofileimg);

	
}//interface 종료