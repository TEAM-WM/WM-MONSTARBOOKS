package com.monstar.books.adcoupon.dto;

import java.sql.Date;

public class AdCouponDto {
	
	private int cpno; //쿠폰번호
	private String cpname; //쿠폰 이름
	private String cpdescription; //쿠폰 설명
	private int cpprice; //쿠폰 할인 가격
	private Date cpcreated; //쿠폰 발행일
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
