package com.monstar.books.event.sevice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import com.monstar.books.adbanner.dto.EventDto;
import com.monstar.books.event.dao.EventDao;


@Service
public class EventDetailService implements EventService{

	@Autowired
	private SqlSession session;

	// 생성자
	public EventDetailService(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>이벤트 디테일 신호");
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		int eventno = Integer.parseInt(request.getParameter("eventno"));
		EventDao dao=session.getMapper(EventDao.class);
		
		EventDto dto=dao.eventdetail(eventno);
		
		model.addAttribute("eventdetail", dto);
	}

}

