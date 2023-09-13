package com.monstar.books.event.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adbanner.dto.EventDto;
import com.monstar.books.adevent.vopage.SearchVO;
import com.monstar.books.event.dao.EventDao;
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
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		SearchVO searchVO=(SearchVO) map.get("searchVO");
		
		EventDao dao=session.getMapper(EventDao.class);
		
//		검색
		String etitle = "";
		String econtent = "";
		String[] brdtitle = request.getParameterValues("searchType");
		System.out.println("brdtitle : " + brdtitle);
		if (brdtitle != null) {
			for (int i = 0; i < brdtitle.length; i++) {
				System.out.println("brdtitle : " + brdtitle[i]);
			}
		}
//	      변수 저장
		if (brdtitle != null) {
			for (String var : brdtitle) {
				if (var.equals("etitle")) {
					etitle = "etitle";
					model.addAttribute("etitle", "true");
				} else if (var.equals("econtent")) {
					econtent = "econtent";
					model.addAttribute("econtent", "true");
				}
			}
		}
//	      검색결과 유지
		String et = request.getParameter("etitle");
		String ec = request.getParameter("econtent");
//	      변수 저장
		if (et != null) {
			if (et.equals("etitle")) {
				etitle =et;
				model.addAttribute("etitle", "true");
			}
		}
		if (ec != null) {
			if (ec.equals("econtent")) {
				econtent = ec;
				model.addAttribute("econtent", "true");
			}
		}

//	    sk값 가져오기
		String searchKeyword = request.getParameter("sk");
		if (searchKeyword == null) {
			searchKeyword = "";
		}
		model.addAttribute("resk", searchKeyword);
		
		System.out.println("sk:" + searchKeyword);
		
//		paging
		String strPage=request.getParameter("page");
		if (strPage==null) 
			strPage="1";
			System.out.println(strPage);
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		
//		검색어에 따른 총 갯수 변화
		int total = 0;
//		4개의 경우의 수로 총갯수 구하기
		if (etitle.equals("etitle") && econtent.equals("")) {
			total = dao.selectBoardTotCount1(searchKeyword);
		} else if (etitle.equals("") && econtent.equals("econtent")) {
			total = dao.selectBoardTotCount2(searchKeyword);
		} else if (etitle.equals("etitle") && econtent.equals("econtent")) {
			total = dao.selectBoardTotCount3(searchKeyword);
		} else if (etitle.equals("") && econtent.equals("")) {
			total = dao.selectBoardTotCount4(searchKeyword);
		}
		System.out.println("tot" + total);
		
		searchVO.pageCalculate(total);
		
//		paging 글 번호 전달
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		ArrayList<EventDto> event = null;

		if (etitle.equals("etitle") && econtent.equals("")) {
			model.addAttribute("event", dao.event(rowStart, rowEnd, searchKeyword, "1"));
		} else if (etitle.equals("") && econtent.equals("econtent")) {
			model.addAttribute("event", dao.event(rowStart, rowEnd, searchKeyword, "2"));
		} else if (etitle.equals("etitle") && econtent.equals("econtent")) {
			model.addAttribute("event", dao.event(rowStart, rowEnd, searchKeyword, "3"));
		} else if (etitle.equals("") && econtent.equals("")) {
			model.addAttribute("event", dao.event(rowStart, rowEnd, searchKeyword, "4"));
		}


		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVO", searchVO);
		
//		
//		ArrayList<EventDto> dto=dao.event();
//		
//		model.addAttribute("event", dto);
	}

}

