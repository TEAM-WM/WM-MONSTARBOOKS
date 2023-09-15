package com.monstar.books.adevent.dao;

import java.util.ArrayList;

import com.monstar.books.adbanner.dto.EventDto;

public interface AdEventDao {

	public ArrayList<EventDto> list(int Start, int end, String sk, String selNum);

	public EventDto eventdetail(int eventno);

	public void eventdelete(int eventno);

	public void eventwrite(String etitle,String econtent,String efilesrc);

	public int selectBoardTotCount1(String searchKeyword);
	public int selectBoardTotCount2(String searchKeyword);
	public int selectBoardTotCount3(String searchKeyword);
	public int selectBoardTotCount4(String searchKeyword);

	public void eventmodify(int eventno, String etitle);

	public void eventmodify2(int eventno, String efilesrc);

}
