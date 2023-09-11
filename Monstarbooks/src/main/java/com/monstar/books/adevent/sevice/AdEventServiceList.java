package com.monstar.books.adevent.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adbanner.dto.EventDto;
import com.monstar.books.adbanner.vopage.SearchVO;
import com.monstar.books.adevent.dao.AdEventDao;

@Primary
@Service
public class AdEventServiceList implements AdEventService{

	@Autowired
	private SqlSession session;

	// 생성자
	public AdEventServiceList(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>이벤트 리스트 신호");
		Map<String, Object> map=model.asMap();
//		HttpServletRequest request=(HttpServletRequest) map.get("request");
//		SearchVO searchVO=(SearchVO) map.get("searchVO");
		
		AdEventDao dao=session.getMapper(AdEventDao.class);
		ArrayList<EventDto> dto=dao.list();
		
		model.addAttribute("list", dto);
	}

}

