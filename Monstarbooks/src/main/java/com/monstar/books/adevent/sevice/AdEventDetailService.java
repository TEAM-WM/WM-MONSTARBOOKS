package com.monstar.books.adevent.sevice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import com.monstar.books.adbanner.dto.EventDto;
import com.monstar.books.adevent.dao.AdEventDao;


@Service
public class AdEventDetailService implements AdEventService{

	@Autowired
	private SqlSession session;

	// 생성자
	public AdEventDetailService(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>이벤트 디테일 신호");
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		int eventno = Integer.parseInt(request.getParameter("eventno"));
		AdEventDao dao=session.getMapper(AdEventDao.class);
		
		EventDto dto=dao.eventdetail(eventno);
		System.out.println(dto);
		
		model.addAttribute("eventdetail", dto);
	}

}

