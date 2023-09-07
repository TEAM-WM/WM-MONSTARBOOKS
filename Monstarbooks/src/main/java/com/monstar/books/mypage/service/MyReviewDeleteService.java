package com.monstar.books.mypage.service;

import com.monstar.books.member.dto.MemberDto;
import com.monstar.books.mypage.dao.MyReviewDao;
import com.monstar.books.mypage.dto.MyReviewDto;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
		System.out.println(">>MyReviewDeleteService 서비스");
//		map변환
		Map<String, Object> map = model.asMap();
//		map에서 request추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		MyReviewDao dao = sqlSession.getMapper(MyReviewDao.class);
//		MemberDto member = (MemberDto) request.getSession().getAttribute("user");

		int reviewno = Integer.parseInt(request.getParameter("reviewno"));
		System.out.println("reviewno:"+reviewno);
//		MyReviewDto viewDto = dao.myReviewView(reviewno);
		// 잘못된 reviewNo
//		if (viewDto == null) {
//			log.error("잘못된 reviewNo");
//			// TODO : 예외 처리
//		}
//
//		// 본인의 리뷰만 볼 수 있어야 한다.
//		if (viewDto.getMemberno() != member.getMemberno()) {
//			log.error("잘못된 접근");
//			// TODO : 예외 처리
//		}

		dao.reviewdelete(reviewno);
	}

}
