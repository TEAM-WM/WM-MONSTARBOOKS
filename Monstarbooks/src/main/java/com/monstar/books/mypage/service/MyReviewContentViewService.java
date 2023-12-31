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

import lombok.extern.slf4j.Slf4j;

//230828 [효슬] 마이페이지 리뷰 상세글 페이지 서비스 추가
@Primary
@Service
@Slf4j
public class MyReviewContentViewService implements MyPageService {
	@Autowired
	private SqlSession sqlSession;

	public MyReviewContentViewService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		log.info("MyReviewContentViewService");

		MyReviewDao dao = sqlSession.getMapper(MyReviewDao.class);

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
//		MemberDto member = (MemberDto) request.getSession().getAttribute("user");]
		
//	     로그인 사용자 ID 세션에서 받아오기
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("id");
//		Integer no = (Integer) session.getAttribute("memberNumber");

		System.out.println("id받아줘 :" + mid);
//		System.out.println("memberno받아줘 :" + no);

		int reviewno = Integer.parseInt(request.getParameter("reviewno"));
//		String reviewno = request.getParameter("reviewno");
		System.out.println("reviewno받아줘 서비스 :" + reviewno);
		
		MyReviewDto viewDto = dao.myReviewView(reviewno, mid); //int값
//		MyReviewDto viewDto = dao.myReviewView(reviewno, mid); //string

		// 데이터를 모델에 추가
		model.addAttribute("myreview_view", viewDto);// 뷰로 데이터 전달

		// 잘못된 reviewNo
		if (viewDto == null) {
			log.error("잘못된 reviewNo");
			// TODO : 예외 처리
		}

		// 본인의 리뷰만 볼 수 있어야 한다.
//		if (viewDto.getMid() != mid {
//            log.error("잘못된 접근");
//			 TODO : 예외 처리
//		}

	}
}