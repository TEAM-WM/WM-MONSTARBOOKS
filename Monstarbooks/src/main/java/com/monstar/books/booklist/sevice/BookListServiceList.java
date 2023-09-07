package com.monstar.books.booklist.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.booklist.dao.BookListDao;
import com.monstar.books.booklist.dto.BookListDto;
import com.monstar.books.booklist.dto.BookReviewDto;
import com.monstar.books.booklist.vopage.SearchVO;

@Service
@Primary
public class BookListServiceList implements BookListService {

	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public BookListServiceList(SqlSession session) {
		this.sqlSession = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>베스트 리스트 신호");
		
		BookListDao dao = sqlSession.getMapper(BookListDao.class);
		
		//map 변환, request 추출	
		Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// 세션에서 회원 ID 가져오기
        HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("id");
        
		
		// 230823 진성 추가
		// paging
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
		
//		별점, 리뷰 수
//		ArrayList<BookReviewDto> rdto = dao.starAvgReCnt(dto.get(0).getBookno());


		model.addAttribute("dto", dto);
//		model.addAttribute("rdto", rdto);
		model.addAttribute("totRowCnt",total);
		model.addAttribute("searchVO",searchVO);
		
//		로그인상태인지 확인
		if(memberId != null) {
        	int memberno = dao.getMemberno(memberId);		
            model.addAttribute("memberno",memberno);					
		}else {
			model.addAttribute("memberno",0);
		}
	}// override method

}// class