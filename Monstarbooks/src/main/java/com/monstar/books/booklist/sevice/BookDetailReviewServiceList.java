package com.monstar.books.booklist.sevice;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
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
public class BookDetailReviewServiceList implements BookListService {

	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public BookDetailReviewServiceList(SqlSession session) {
		this.sqlSession = session;
	}

	@SuppressWarnings("unused")
	@Override
	public void execute(Model model) {
		System.out.println(">>>도서 리뷰 페이지 신호");
		// map 변환, request 추출
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

//		String btitle = request.getParameter("btitle5");
//		System.out.println("책이름으으은: " + btitle);
//		model.addAttribute("btitle5", btitle);
		// System.out.println("builder exit value:" + exitval);
		BookListDao dao = sqlSession.getMapper(BookListDao.class);

		// 세션에서 회원 ID 가져오기
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("id");
		System.out.println("id :" + memberId);

		String bookno = request.getParameter("bookno");

		BookListDto dto = dao.bookDetail(bookno);

//				리뷰 페이징
		SearchVO searchVO = (SearchVO) map.get("searchVO");
		String strPage = request.getParameter("page");
		// 처음 null 처리
		if (strPage == null)
			strPage = "1";
		int page = Integer.parseInt(strPage);
		searchVO.setPage(page);

		// 전체 리뷰 수 조회
		int reviewCnt = dao.reviewCnt(bookno);
		searchVO.pageCalculate(reviewCnt);

		// 페이징 글 번호 전달
		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();

		ArrayList<BookReviewDto> rdto = dao.bookReivew(bookno, rowStart, rowEnd);

//				별점 평균 조회
		// 리연 null 값 처리 추가
//				float starAvg = dao.starAvg(bookno);
//		Float starAvg = dao.starAvg(bookno);
//		if (starAvg == null) {
//			starAvg = 0.0f; // 기본값 설정
//		}
//		model.addAttribute("list", dto);
		model.addAttribute("review", rdto);
//		model.addAttribute("avg", starAvg);
//		model.addAttribute("reCnt", reviewCnt);

//				차트
//		HashSet<Integer> addedStars = new HashSet<Integer>();// 리연추가 === 별값 중복 추가 방지
//
//		JSONArray arr = new JSONArray();
//		ArrayList<BookReviewDto> starCnt = dao.starChart(bookno);
//
//		ArrayList<JSONObject> jsonList = new ArrayList<JSONObject>(); // JSON 객체를 담을 리스트
//
//		for (BookReviewDto re : starCnt) {
//			JSONObject obj = new JSONObject();
//			obj.put("star", re.getRstar());
//			obj.put("starCnt", re.getStarCnt());
//
////				    ==== 리연 추가=== 
//			if (obj != null && re.getStarCnt() != 0) {
//				// star 값이 이미 추가되었는지 확인하고 추가되지 않았다면 추가
//				if (!addedStars.contains(re.getRstar())) {
//					jsonList.add(obj);
//					// 추가된 star 값을 set 에 추가
//					addedStars.add(re.getRstar());
//				} // if
//			} // if//==리연 추가 종료
//		} // for
//
//		// ==== 리연 추가 ==== 나머지 별점에 대한 0 추가 + 별점 역정렬
//		for (int star = 1; star <= 5; star++) {
//			JSONObject obj = new JSONObject();
//			obj.put("star", star);
//			obj.put("starCnt", 0);
//
//			if (!addedStars.contains(star)) {
//				jsonList.add(obj);
//			}
//		}
//		// 별점(star)을 기준으로 정렬
//		Collections.sort(jsonList, (a, b) -> Integer.compare((int) b.get("star"), (int) a.get("star")));
//
//		// JSON 배열로 변환
//		for (JSONObject obj : jsonList) {
//			arr.add(obj);
//		} // 리연 추가 종료
//
//		model.addAttribute("arr", arr);
//		System.out.println(arr);
//				로그인상태인지 확인
		if (memberId != null) {
			int memberno = dao.getMemberno(memberId);
			model.addAttribute("memberno", memberno);
		} else {
			model.addAttribute("memberno", 0);
		} // if

	}// override method
}// class