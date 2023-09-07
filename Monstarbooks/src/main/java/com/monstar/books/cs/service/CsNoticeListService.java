package com.monstar.books.cs.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.monstar.books.adfaq.service.AdFaqService;
import com.monstar.books.adnotice.dto.AdNoticeDto;
import com.monstar.books.cs.dao.CsDao;
import com.monstar.books.vopage.SearchVo;

public class CsNoticeListService implements AdFaqService {
	@Autowired
	private SqlSession session;

	// 생성자
	public CsNoticeListService(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>공지사항 리스트");
		CsDao dao = session.getMapper(CsDao.class);
		Map<String, Object> map = model.asMap();
		
		// 맵에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String searchword = request.getParameter("word"); 
		if(searchword==null || searchword.equals("")) {
			searchword="";
		}
		
		
		String strPage = request.getParameter("page");
		// 시작 페이지 값이 없다면 1로 변경해준다.
		if (strPage == null || strPage.equals("")) {
			strPage = "1";
		}
		System.out.println("page : " + strPage);
		int page = Integer.parseInt(strPage);

		// 검색 vo에 페이지값 담아주기
		SearchVo searchVO = new SearchVo();
		searchVO.setPage(page);
		
		System.out.println("검색어 : " + searchword);
		// 검색에 따른 총갯수 변형
		int total = dao.csNoticeCount(searchword);;

		// 총 갯수
		System.out.println("total cnt: " + total);
		searchVO.pageCalculate(total);
		/* #9 페이징 글 번호 전달 */
		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();

		ArrayList<AdNoticeDto> dto =  dao.csNoticeList(rowStart, rowEnd, searchword);

		/* 계산 결과 출력하기 */
//		System.out.println("total row: " + total);
//		System.out.println("clickpage: " + searchVO.getPage());
//		System.out.println("pageStart: " + searchVO.getPageStart());
//		System.out.println("pageEnd: " + searchVO.getPageEnd());
//		System.out.println("pageTot: " + searchVO.getTotPage());
//		System.out.println("rowStart: " + searchVO.getRowStart());
//		System.out.println("rowEnd: " + searchVO.getRowEnd());

		
		model.addAttribute("searchKey", searchword);
		model.addAttribute("count", total);
		model.addAttribute("searchVO", searchVO);
	  		
		
		model.addAttribute("dto",dto);
	}// override method
}//class