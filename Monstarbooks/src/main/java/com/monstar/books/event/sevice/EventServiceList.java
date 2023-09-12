package com.monstar.books.event.sevice;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adbanner.dto.EventDto;
import com.monstar.books.adevent.dao.AdEventDao;
@Primary
@Service
public class EventServiceList implements EventService{

	@Autowired
	private SqlSession session;

	// 생성자
	public EventServiceList(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>이벤트 신호");
		Map<String, Object> map=model.asMap();
//		HttpServletRequest request=(HttpServletRequest) map.get("request");
//		SearchVO searchVO=(SearchVO) map.get("searchVO");
		
		AdEventDao dao=session.getMapper(AdEventDao.class);
		ArrayList<EventDto> dto=dao.list();
		
		model.addAttribute("list", dto);
	}

}

