package com.monstar.books.member.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDto {
	private int memberno;//회원번호
	private String mid;//아이디
	private String mpw;//비밀번호
	private String mnewpwd;//새로 입력할 비밀번호
	private Date mbirth;//생일
	private String mname;//이름
	private String memail;//이메일
	private String mtel;//전화번호
	private Date mregdate;// 가입날짜
	private String to_regdate;//변환된 날짜
	private String mprofileimg;//프로필 이미지 경로
	private String mfavorite; // 선호장르
	private String mauthority;// 관리자 / 사용자 권한 여부
	private String deleted;// 회원 탈퇴 여부 -- 탈퇴시 yes 가입시 no
	

}