package com.monstar.books.m3pop.dao;

import java.util.ArrayList;

import com.monstar.books.m3pop.dto.QnaDto;




public interface QnaDao {

	public ArrayList<QnaDto> list(int start,int end,String sk,String selNum);
	

	// String quserID,
	public void write(String qcategory, String qtitle,
			String qcontent ,String fname,String mid);
	
	public QnaDto contentView(int mid);
	
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
	public int selectBoardTotCount(String searchword);
	public int selectBoardTotCount2(String searchword);
	public int selectBoardTotCount3(String searchword);
	public int selectBoardTotCount4(String searchword);
	
	
	
}
