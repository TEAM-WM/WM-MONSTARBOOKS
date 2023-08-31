package com.monstar.books.mypage.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Data
public class MyProfileDto { //m_member 테이블 사용
	private int memberno; //회원번호
	private String mid;		//회원아이디
	private String mpw;		//회원비밀번호
	private Timestamp mbirth;	//회원생년월일
	private String mname;		//회원이름
	private String memail;		//회원이메일
	private String mtel;		//회원연락처
	private Timestamp mregdate;	//회원가입날짜
	private String mprofileimg;	//회원프로필사진
	private String mfavorite;	//회원선호장르
	private String mauthority;	//회원권한
	private String deleted;		//회원 탈퇴 여부 -- 탈퇴시 yes 가입시 no
	
}// Dto 종료





