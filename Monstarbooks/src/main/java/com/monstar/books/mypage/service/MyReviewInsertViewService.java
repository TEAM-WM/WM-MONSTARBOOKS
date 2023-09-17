package com.monstar.books.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyReviewDao;
import com.monstar.books.mypage.dto.MyReviewDto;
import com.monstar.books.mypage.dto.OrderDetailDto;

import lombok.extern.slf4j.Slf4j;

@Primary
@Service
@Slf4j
public class MyReviewInsertViewService implements MyPageService {
	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public MyReviewInsertViewService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		log.info("마이리뷰 글쓰기폼 신호");
		// 맵 변환
		Map<String, Object> map = model.asMap();
		// 맵에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		MyReviewDao dao = sqlSession.getMapper(MyReviewDao.class);

//	     로그인 사용자 ID 세션에서 받아오기
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("id");
//		Integer no = (Integer) session.getAttribute("memberNumber");

		System.out.println("id받아줘 :" + mid);


//		parseint전에 int 0 초기화 및 null값 들어오는지 확인		

		int bookno = Integer.parseInt(request.getParameter("bookno"));
//		int memberno = Integer.parseInt(request.getParameter("memberno"));
		System.out.println("bookno:"+bookno);

		MyReviewDto bcate = dao.bcategories(bookno,mid);

//     잘못된 bookno
		if (bcate == null) {
			log.error("잘못된 bookno");
			// TODO : 예외 처리 또는 오류 응답을 반환하는 코드 추가
		}

		// 본인의 리뷰만 볼 수 있어야 한다.
		// if (bcate.getMemberno() != member.getMemberno()) {
		// log.error("잘못된 접근");
		// TODO : 예외 처리 또는 오류 응답을 반환하는 코드 추가

		// 데이터를 모델에 추가
		model.addAttribute("bcate", bcate); // 뷰로 데이터 전달
	}

}
