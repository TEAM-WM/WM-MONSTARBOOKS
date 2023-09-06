package com.monstar.books.mypage.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyReviewDao;
import com.monstar.books.mypage.dto.BookCategoryDto;
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
		Map<String, Object> map = model.asMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		MyReviewDao dao = sqlSession.getMapper(MyReviewDao.class);
//		MemberDto member = (MemberDto) request.getSession().getAttribute("user");
		
		int reviewno = Integer.parseInt(request.getParameter("reviewno"));
		MyReviewDto viewDto = dao.myReviewView(reviewno);
		

		// 잘못된 reviewNo
//        if (viewDto == null) {
//            log.error("잘못된 reviewNo");
//            // TODO : 예외 처리
//        }

		// 본인의 리뷰만 볼 수 있어야 한다.
//		if (viewDto.getMemberno() != member.getMemberno()) {
//            log.error("잘못된 접근");
//			 TODO : 예외 처리
//		}

		// 데이터를 모델에 추가
		model.addAttribute("myreview_view", viewDto);// 뷰로 데이터 전달

		
	}
}