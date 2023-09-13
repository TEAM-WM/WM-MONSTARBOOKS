package com.monstar.books.member.dao;

import java.util.ArrayList;

import com.monstar.books.member.dto.MemberDto;
import com.monstar.books.order.dto.CouponDto;

public interface MemberDao {
	public MemberDto getData(String mid); // 아이디로 회원정보 얻어오기
	public MemberDto getData2(int memberno); // 회원번호로 회원정보 얻어오기
	
	public void insert(MemberDto dto); // 회원가입

	public ArrayList<MemberDto> list();// 관리자 회원 목록

	public String isExist(String inputId); // 아이디 중복체크

	public ArrayList<MemberDto> idSearch(MemberDto dto);// 아이디 찾기
	
	// usersDto 로 비밀번호 찾아오기
	public String pwdSearch(MemberDto dto);// 비밀번호 찾기

	// 비밀번호 업데이트
	public void updatePwd(MemberDto dto);// 비밀번호 찾기 후 업데이트

	// 페이징 처리를 위한 메소드
	// 검색처리를 위해 메소드에 파라미터 값 추가
	public int selectBoardTotCount1(String searchKeyword);// 아이디로만
	public int selectBoardTotCount2(String searchKeyword);// 이름으로만
	public int selectBoardTotCount3(String searchKeyword);// 둘 다 존재
	public int selectBoardTotCount4(String searchKeyword);// 둘 다 없음
	public ArrayList<MemberDto> list(int rowStart, int rowEnd, String searchKeyword, String setNum);
	
	// 회원 권한 변경
	public void updateStatus(MemberDto dto);
	
	// 회원 탈퇴처리
	public void delete(int no);
	// 회원 복구 처리
	public void restore(int no);
	
	public void updateUser(MemberDto dto);// 회원정보 수정
	
	//회원 보유 쿠폰 목록
	public ArrayList<CouponDto> getDataMemberCoupon(int memberno);
}// ======== MemberDao ========