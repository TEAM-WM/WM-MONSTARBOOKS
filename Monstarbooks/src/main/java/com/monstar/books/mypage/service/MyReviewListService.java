package com.monstar.books.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyReviewDao;

@Service
public class MyReviewListService implements MyPageService {
	
	private SqlSession sqlSession;
    // 생성자
	public MyReviewListService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>마이리뷰리스트 신호");

		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		MyReviewDao dao =sqlSession.getMapper(MyReviewDao.class);
		
		try {
	        int reviewno = Integer.parseInt(request.getParameter("reviewno"));
		
		dao.reviewlist();
		} catch (NumberFormatException e) {
			// TODO: handle exception
		} catch (Exception e) {
			// TODO: handle exception
		}
        
	}// execute method

}// class