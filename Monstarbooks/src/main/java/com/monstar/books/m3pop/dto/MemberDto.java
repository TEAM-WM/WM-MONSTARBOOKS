package com.monstar.books.m3pop.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {

	private int memberno; //1
	private String mid; //2
	private String mpw; //3
	private Date mbirth; //4
	private String memail; //5
	private String mname; //6	
	private String mtel; //7
	private Date mregdate; //8
	private String mprofileimg; //9
	private String mfavorite; //10
	private String mauthority; //11
	private String deleted;	 //12
	

	
//	public BoardDto() {
//		// TODO Auto-generated constructor stub
//	}
//		
//	public BoardDto(int bid, String bname, String btitle, String bcontent, Timestamp bdate, int bhit, int bgroup,
//		int bstep, int bindent) {
//		
//		super();
//		this.bid = bid;
//		this.bname = bname;
//		this.btitle = btitle;
//		this.bcontent = bcontent;
//		this.bdate = bdate;
//		this.bhit = bhit;
//		this.bgroup = bgroup;
//		this.bstep = bstep;
//		this.bindent = bindent;
//	}
//
//
//
//
//	public int getBid() {
//		return bid;
//	}
//	public void setBid(int bid) {
//		this.bid = bid;
//	}
//	public String getBname() {
//		return bname;
//	}
//	public void setBname(String bname) {
//		this.bname = bname;
//	}
//	public String getBtitle() {
//		return btitle;
//	}
//	public void setBtitle(String btitle) {
//		this.btitle = btitle;
//	}
//	public String getBcontent() {
//		return bcontent;
//	}
//	public void setBcontent(String bcontent) {
//		this.bcontent = bcontent;
//	}
//	public Timestamp getBdate() {
//		return bdate;
//	}
//	public void setBdate(Timestamp bdate) {
//		this.bdate = bdate;
//	}
//	public int getBhit() {
//		return bhit;
//	}
//	public void setBhit(int bhit) {
//		this.bhit = bhit;
//	}
//	public int getBgroup() {
//		return bgroup;
//	}
//	public void setBgroup(int bgroup) {
//		this.bgroup = bgroup;
//	}
//	public int getBstep() {
//		return bstep;
//	}
//	public void setBstep(int bstep) {
//		this.bstep = bstep;
//	}
//	public int getBindent() {
//		return bindent;
//	}
//	public void setBindent(int bindent) {
//		this.bindent = bindent;
//	}
	
		
}
