package com.monstar.books.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.member.dto.MemberDto;
import com.monstar.books.mypage.dao.MyReviewDao;
import com.monstar.books.mypage.vopage.SearchVO;

@Service
@Primary
public class MyCouponListService implements MyPageService {

	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public MyCouponListService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>마이쿠폰리스트 신호");

		// map 변환, request 추출
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

//     로그인 사용자 ID 세션에서 받아오기
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("id");		
		System.out.println("id받아줘 :" + mid);
		
		MyReviewDao dao = sqlSession.getMapper(MyReviewDao.class);

		
		
	}// execute method

}// class
