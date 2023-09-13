package com.monstar.books.mypage.dao;

import java.util.ArrayList;

import com.monstar.books.member.dto.MemberDto;

//230903 [효슬] MyProfileDto(임시) -> MemberDto로 통합 작업
public interface MyProfileDao {
	
	//프로필 메인 (조회)
//	public ArrayList<MemberDto> list();	
	public ArrayList<MemberDto> list(String mid);
	
	//프로필 이미지 삭제
	public void delete(String smid);

	//프로필 이미지 폼 / 수정 폼
	public MemberDto myprofileview(String smid);
	
	//프로필 수정 기능
	public void profileupdate(String smid, String mprofileimg);

	//리뷰 쓰기 서비스 / 멤버 테이블 아이디 조회
	public ArrayList<MemberDto> selectId(String mid);
	

}//interface 종료