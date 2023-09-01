package com.monstar.books.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyProfileDao;

@Service
public class MyProfileListService implements MyPageService {
	
	private SqlSession sqlSession;
    // 생성자
	public MyProfileListService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>마이프로필뷰 신호");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
        MyProfileDao dao = sqlSession.getMapper(MyProfileDao.class);
        
        try {
        int memberno = Integer.parseInt(request.getParameter("memberno"));
//     String mid = request.getParameter("mid");
        dao.list();
		} catch (NumberFormatException e) {
			// TODO: handle exception
		} catch (Exception e) {
			// TODO: handle exception
		}
        
	}// execute method

}// class