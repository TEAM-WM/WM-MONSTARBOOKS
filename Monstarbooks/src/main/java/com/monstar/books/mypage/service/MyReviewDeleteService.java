package com.monstar.books.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyReviewDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MyReviewDeleteService implements MyPageService {

	@Autowired
	private SqlSession sqlSession;

	public MyReviewDeleteService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>MyReviewDeleteService 글 삭제 신호");
//		map변환
		Map<String, Object> map = model.asMap();
//		map에서 request추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
//	    로그인 사용자 ID 세션에서 받아오기
		HttpSession session = request.getSession();
        String mid = (String) session.getAttribute("id");
		
		System.out.println("id받아줘 :" + mid);
        
		MyReviewDao dao = sqlSession.getMapper(MyReviewDao.class);	
		
		// 요청 파라미터로부터 데이터 추출
		int reviewno = Integer.parseInt(request.getParameter("reviewno"));
		System.out.println("reviewno:"+reviewno);
		
		dao.reviewdelete(reviewno);
		
        
//		// 본인의 리뷰만 볼 수 있어야 한다.
//		if (viewDto.getMemberno() != member.getMemberno()) {
//			log.error("잘못된 접근");
//			// TODO : 예외 처리
//		}


	}

}
