package com.monstar.books.adqna.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class QnaDto {
	private int qnano; //문의번호
	private int memberno; //회원번호
	private String qcategory; //문의유형
	private String qtitle; //제목
	private String qcontent; //질문내용
	private Date qregdate; //문의날짜
	private String qstatus; //처리상태
	private String qanswer; //답변
	private String qfilesrc; //첨부파일
	private String deleted; //삭제여부
	
	private MemberDto member;
	
	public MemberDto getMember() {
		return member;
	}
	public void setMember(MemberDto member) {
		this.member = member;
	}
	public int getQnano() {
		return qnano;
	}
	public void setQnano(int qnano) {
		this.qnano = qnano;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public String getQcategory() {
		return qcategory;
	}
	public void setQcategory(String qcategory) {
		this.qcategory = qcategory;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public Date getQregdate() {
		return qregdate;
	}
	public void setQregdate(Date qregdate) {
		this.qregdate = qregdate;
	}
	public String getQstatus() {
		return qstatus;
	}
	public void setQstatus(String qstatus) {
		this.qstatus = qstatus;
	}
	public String getQanswer() {
		return qanswer;
	}
	public void setQanswer(String qanswer) {
		this.qanswer = qanswer;
	}
	public String getQfilesrc() {
		return qfilesrc;
	}
	public void setQfilesrc(String qfilesrc) {
		this.qfilesrc = qfilesrc;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
}