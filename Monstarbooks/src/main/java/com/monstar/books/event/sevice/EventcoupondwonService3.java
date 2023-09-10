package com.monstar.books.event.sevice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adevent.dao.AdEventDao;


@Service
public class EventcoupondwonService3 implements EventService{

	@Autowired
	private SqlSession session;

	// 생성자
	public EventcoupondwonService3(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>쿠폰 받기 신호");
//		Map<String, Object> map=model.asMap();
//		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		AdEventDao dao=session.getMapper(AdEventDao.class);
		
//		String mid=request.getParameter("mid");
//		String cpname=request.getParameter("cpname");
//		
//		System.out.println(mid);
//		System.out.println(cpname);
		
		dao.eventcoupondwon3();
	}

}

