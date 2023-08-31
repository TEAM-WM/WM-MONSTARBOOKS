package com.monstar.books.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyProfileDao;

@Service
public class MyProfileListService implements MyPageService {
	
	@Autowired
	private SqlSession sqlSession;
    // 생성자
	public MyProfileListService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	//230822,23,24 [효슬] 마이페이지 프로필뷰 메인 페이지 서비스
	@Override
	public void execute(Model model) {
		System.out.println(">>>MyProfileListService 마이프로필 메인페이지 신호");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
        MyProfileDao dao = sqlSession.getMapper(MyProfileDao.class);
        
//     String mid = request.getParameter("mid");
		dao.list();
		model.addAttribute("list", dao.list());

	}// execute method

}// class