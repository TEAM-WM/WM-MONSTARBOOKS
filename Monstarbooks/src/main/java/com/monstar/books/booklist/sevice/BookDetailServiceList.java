package com.monstar.books.booklist.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.booklist.dao.BookListDao;
import com.monstar.books.booklist.dto.BookListDto;
import com.monstar.books.booklist.dto.BookReviewDto;
import com.monstar.books.booklist.vopage.SearchVO;

@Service
public class BookDetailServiceList implements BookListService {

	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public BookDetailServiceList(SqlSession session) {
		this.sqlSession = session;
	}

	@SuppressWarnings("unused")
	@Override
	public void execute(Model model) {
		
		System.out.println(">>>도서 상세 페이지 신호");
		
		BookListDao dao = sqlSession.getMapper(BookListDao.class);

		//map 변환, request 추출	
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// 세션에서 회원 ID 가져오기
        HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("id");
        System.out.println("id :"+memberId);
		
        String bookno = request.getParameter("bookno");

        BookListDto dto = dao.bookDetail(bookno);
		
//		리뷰 페이징
		SearchVO searchVO = (SearchVO) map.get("searchVO");
		String strPage = request.getParameter("page");
		//처음 null 처리
		if(strPage == null) 
			strPage = "1";
		int page = Integer.parseInt(strPage);
		searchVO.setPage(page);
		
		//전체 리뷰 수 조회
		int reviewCnt = dao.reviewCnt(bookno);
		searchVO.pageCalculate(reviewCnt);
		
		//페이징 글 번호 전달
		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();
		
		ArrayList<BookReviewDto> rdto = dao.bookReivew(bookno,rowStart,rowEnd);
		
//		별점 평균 조회
		//리연 null 값 처리 추가 
//		float starAvg = dao.starAvg(bookno);
		Float starAvg = dao.starAvg(bookno);
		if (starAvg == null) {
		    starAvg = 0.0f; // 기본값 설정
		}
		model.addAttribute("list",dto);
		model.addAttribute("review",rdto);
		model.addAttribute("avg",starAvg);
		model.addAttribute("reCnt",reviewCnt);
		
//		차트
		JSONArray arr = new JSONArray();
		ArrayList<BookReviewDto> starCnt = dao.starChart(bookno); 
		for (BookReviewDto re : starCnt) {
			JSONObject obj = new JSONObject();
			obj.put("star",re.getRstar());
			obj.put("starCnt", re.getStarCnt());
			if (obj != null) {
				arr.add(obj);
			}
		}
		model.addAttribute("arr",arr);
		
//		로그인상태인지 확인
		if(memberId != null) {
        	int memberno = dao.getMemberno(memberId);		
            model.addAttribute("memberno",memberno);					
		}else {
			model.addAttribute("memberno",0);
		}

	}// override method

}// class