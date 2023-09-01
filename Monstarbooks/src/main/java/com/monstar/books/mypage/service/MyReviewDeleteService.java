package com.monstar.books.mypage.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class MyReviewDeleteService implements MyPageService {
	
	@Autowired
    private SqlSession sqlSession;
	
	public MyReviewDeleteService(SqlSession sqlSession) {
		 this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

	}

}
