package com.monstar.books.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyReviewDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

// 230827 [효슬] 마이페이지 리뷰 글쓰기 서비스 추가
@Primary
@Service
public class MyReviewInsertService implements MyPageService {
	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public MyReviewInsertService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>마이리뷰 글쓰기 신호");

//		// 맵 변환
//		Map<String, Object> map = model.asMap();
//		// 맵에서 request 추출
//		HttpServletRequest request = (HttpServletRequest) map.get("request");



	}

	}
