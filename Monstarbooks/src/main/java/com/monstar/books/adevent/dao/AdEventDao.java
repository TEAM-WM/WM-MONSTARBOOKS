package com.monstar.books.adevent.dao;

import java.util.ArrayList;

import com.monstar.books.adbanner.dto.EventDto;

public interface AdEventDao {

	public ArrayList<EventDto> list();

	public EventDto eventdetail(int eventno);

	public void eventdelete(int eventno);

	public void eventcoupondwon1();
	public void eventcoupondwon2();
	public void eventcoupondwon3();

}
