package com.monstar.books.member.dao;

import java.util.ArrayList;

import com.monstar.books.member.dto.MemberDto;

public interface MemberDao {
	public MemberDto getData(String mid); // 아이디로 회원정보 얻어오기
	public void insert(MemberDto dto); // 회원가입
	public ArrayList<MemberDto> list();// 관리자 회원 목록
	public String isExist(String inputId); //아이디 중복체크
	public ArrayList<MemberDto> idSearch(MemberDto dto);//아이디 찾기
	//usersDto 로 비밀번호 찾아오기
	public String pwdSearch(MemberDto dto);// 비밀번호 찾기
	//비밀번호 업데이트
	public void updatePwd(MemberDto dto);// 비밀번호 찾기 후 업데이트>>>>>>> refs/remotes/upstream/master
}//======== MemberDao ========