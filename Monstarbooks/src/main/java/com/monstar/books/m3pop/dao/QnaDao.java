package com.monstar.books.m3pop.dao;

import java.util.ArrayList;

import com.monstar.books.m3pop.dto.MemberDto;
import com.monstar.books.m3pop.dto.QnaDto;




public interface QnaDao {

	public ArrayList<QnaDto> list(int start,int end,String sk,String selNum,String memberno);
	
	public MemberDto getData(String mid); // 아이디로 회원정보 얻어오기
	// String quserID,
	public void write(String qcategory, String qtitle,
			String qcontent ,String fname,int memberno);
	
	public QnaDto contentView(int memberno);
	
	public void upHit(String sbid);
	//String quserID,
	
	public void modify(String qnano,String qcategory,
			String qtitle,String qcontent,String fname);
	
	public void delete(String sbid);
	
	public QnaDto replyView(String sbid);
	
	public void reply(String bid, String bname, String btitle, 
			String bcontent, String bgroup, String bstep, String bindent);
	
	public void replyShape(String bgroup, String bstep);
	
	//public int selectBoardTotCount();
	public int selectBoardTotCount(String searchword,String memberno);
	public int selectBoardTotCount2(String searchword,String memberno);
	public int selectBoardTotCount3(String searchword,String memberno);
	public int selectBoardTotCount4(String memberno);
	
	
	
}
