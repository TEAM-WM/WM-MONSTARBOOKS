package com.monstar.books.booklist.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.booklist.dao.BookListDao;
import com.monstar.books.booklist.dto.BookListDto;
import com.monstar.books.booklist.dto.BookReviewDto;

@Service
public class BookDetailServiceList implements BookListService {

	@Autowired
	private SqlSession session;

	// 생성자
	public BookDetailServiceList(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>도서 상세 페이지 신호");
		
		//map 변환, request 추출	
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String bookno = request.getParameter("bookno");
		BookListDao dao = session.getMapper(BookListDao.class);
		
		BookListDto dto = dao.bookDetail(bookno);
		ArrayList<BookReviewDto> rdto = dao.bookReivew(bookno);
		float starAvg = dao.starAvg(bookno);
		int reviewCnt = dao.reviewCnt(bookno);
		
		model.addAttribute("detail",dto);
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
		
		
	}// override method

}// class