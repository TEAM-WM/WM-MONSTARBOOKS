package com.monstar.books.m3pop.dao;

import com.monstar.books.m3pop.dto.MemberDto;

public interface MemberDao {

//	public ArrayList<QnaDto> list(int start,int end,String sk,String selNum);
//	
//	public ArrayList<JobDto> sumByjob();
//	// String quserID,
//	public void write(String qcategory, String qtitle,String qcontent ,String fname);
//	
	public MemberDto contentView(String member);
	public MemberDto login(String mid,String mpw);
	public String pwCheck(String mid,String mpw);
	//public void upHit(String sbid);
	//String quserID,
	//String mid, String mbirth,
	//String mname,String memail ,String mtel,String mprofileimg,String mfavorite
	public void modify(String mid, String mbirth,String memail,
			String mtel,String mfavorite);

	//public void delete(String sbid);
	
	//public QnaDto replyView(String sbid);
	
	//public void reply(String bid, String bname, String btitle, 
	//		String bcontent, String bgroup, String bstep, String bindent);
	
	//public void replyShape(String bgroup, String bstep);
	
	//public int selectBoardTotCount();
	//public int selectBoardTotCount(String searchword);
	//public int selectBoardTotCount2(String searchword);
	//public int selectBoardTotCount3(String searchword);
	//public int selectBoardTotCount4(String searchword);
	
	
	
}
