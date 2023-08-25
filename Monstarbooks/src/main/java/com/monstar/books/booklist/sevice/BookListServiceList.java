package com.monstar.books.booklist.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.booklist.dao.BookListDao;
import com.monstar.books.booklist.dto.BookListDto;
import com.monstar.books.booklist.vopage.SearchVO;

@Service
@Primary
public class BookListServiceList implements BookListService {

	@Autowired
	private SqlSession session;

	// 생성자
	public BookListServiceList(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>베스트 리스트 신호");
		
		BookListDao dao = session.getMapper(BookListDao.class);
		
		// 230823 진성 추가
		// paging
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SearchVO searchVO = (SearchVO) map.get("searchVO");
		
		String strPage = request.getParameter("page");
//		처음 null 처리
		if(strPage == null) 
			strPage = "1";
		int page = Integer.parseInt(strPage);
		searchVO.setPage(page);
		
//		글의 총갯수 구하기
		int total = dao.TotCount();
		searchVO.pageCalculate(total);
		
//		페이징 글 번호 전달
		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();
		ArrayList<BookListDto> dto = dao.list(rowStart,rowEnd);
//		ArrayList<BestListDto> dto = dao.list();
		
		model.addAttribute("dto", dto);
		model.addAttribute("totRowCnt",total);
		model.addAttribute("searchVO",searchVO);

	}// override method

}// class