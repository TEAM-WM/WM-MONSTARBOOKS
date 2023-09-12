package com.monstar.books.event.sevice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adevent.dao.AdEventDao;


@Service
public class EventcoupondwonService implements EventService{

	@Autowired
	private SqlSession session;

	// 생성자
	public EventcoupondwonService(SqlSession session) {
		this.session = session;
	}


	@Override
	public void execute(Model model) {
		System.out.println(">>>쿠폰 받기 신호");
		
		Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
		
        AdEventDao dao=session.getMapper(AdEventDao.class);
        
		//회원번호 받아오기
        HttpSession Session = request.getSession();
        Integer no = (Integer) Session.getAttribute("memberNumber");
        System.out.println("회원번호: " + no);

		if(no==null) {
			no=0;
		}

		String cpnoStr = request.getParameter("cpno");
		int cpno = Integer.parseInt(cpnoStr);
		System.out.println(cpno);
		String cpcreated = request.getParameter("cpcreated");
		String cpvalid = request.getParameter("cpvalid");
		
		
		dao.eventcoupondwon(no,cpno,cpcreated,cpvalid);
	}
	
}