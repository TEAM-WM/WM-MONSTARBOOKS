package com.monstar.books.member.dao;

import java.util.ArrayList;

import com.monstar.books.member.dto.MemberDto;

public interface MemberDao {
	public MemberDto getData(String mid); // 아이디로 회원정보 얻어오기
	public void insert(MemberDto dto); // 회원가입
	public ArrayList<MemberDto> list();// 관리자 회원 목록
	public String isExist(String inputId); //아이디 중복체크
}//======== MemberDao ========