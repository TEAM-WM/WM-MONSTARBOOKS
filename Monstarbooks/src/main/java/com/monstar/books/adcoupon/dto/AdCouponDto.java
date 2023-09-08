package com.monstar.books.adcoupon.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AdCouponDto {
	
	private int cpno; //쿠폰번호 (회원이 가지고 있는 쿠폰의 번호)
	private int cpno2; // 쿠폰번호 ( 관리자가 등록하는 쿠폰 번호)
	private String cpname; //쿠폰 이름
	private String cpdescription; //쿠폰 설명
	private int cpprice; //쿠폰 할인 가격
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cpcreated; //쿠폰 발행일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cpvalid; //쿠폰 유효날짜 ( 언제까지 인지)
	private String cpstatus; //쿠폰이 사용가능한지 아닌지
	
	private String newStatus;   //쿠폰상태 변경 사용가능/사용불가
	
	
	
	public String getNewStatus() {
		return newStatus;
	}
	public void setNewStatus(String newStatus) {
		this.newStatus = newStatus;
	}
	//생성자
	
	
	public int getCpno() {
		return cpno;
	}
	public int getCpno2() {
		return cpno2;
	}
	public void setCpno2(int cpno2) {
		this.cpno2 = cpno2;
	}
	public void setCpno(int cpno) {
		this.cpno = cpno;
	}
	public String getCpname() {
		return cpname;
	}
	public void setCpname(String cpname) {
		this.cpname = cpname;
	}
	public String getCpdescription() {
		return cpdescription;
	}
	public void setCpdescription(String cpdescription) {
		this.cpdescription = cpdescription;
	}
	public int getCpprice() {
		return cpprice;
	}
	public void setCpprice(int cpprice) {
		this.cpprice = cpprice;
	}
	public Date getCpcreated() {
		return cpcreated;
	}
	public void setCpcreated(Date cpcreated) {
		this.cpcreated = cpcreated;
	}
	public Date getCpvalid() {
		return cpvalid;
	}
	public void setCpvalid(Date cpvalid) {
		this.cpvalid = cpvalid;
	}
	public String getCpstatus() {
		return cpstatus;
	}
	public void setCpstatus(String cpstatus) {
		this.cpstatus = cpstatus;
	}

	
	
}
