package com.monstar.books.adqna.dao;

import java.util.ArrayList;

import com.monstar.books.adqna.dto.QnaDto;
import com.monstar.books.adqna.dto.MemberDto;


public interface QnaDao {
	
	public ArrayList<QnaDto> list(int Start,int end, String sk, String selNum);

//	public int selectQnatotCount();

	public QnaDto qnadetail(int qnano);
	
	public void qnaAnswer(int qnano, String qanswer);

	public QnaDto qnadetailreply(int qnano, String qanswer);

	public void qnadelete(int qnano);

	public void QnaStatusService(int qnano, String qstatus);

	public int selectBoardTotCount1(String searchKeyword);
	public int selectBoardTotCount2(String searchKeyword);
	public int selectBoardTotCount3(String searchKeyword);
	public int selectBoardTotCount4(String searchKeyword);

//	public void qnadetailreply(QnaDto existingQna);
	
}//interface 종료