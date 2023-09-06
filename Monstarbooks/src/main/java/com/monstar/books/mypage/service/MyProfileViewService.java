package com.monstar.books.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.member.dto.MemberDto;
import com.monstar.books.mypage.dao.MyProfileDao;
import com.monstar.books.mypage.dto.MyProfileDto;

@Service
@Primary
public class MyProfileViewService implements MyPageService {
	@Autowired
	private SqlSession sqlSession;
    // 생성자
	public MyProfileViewService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	//230830 [효슬] 마이페이지 프로필(상세) 뷰 서비스	
	@Override
	public void execute(Model model) {
		System.out.println(">>>MyProfileViewService 마이프로필뷰 신호");
		
//		map변환
		Map<String, Object> map=model.asMap();
//		map에서 request추출
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		String mid = request.getParameter("mid");	
        MyProfileDao dao = sqlSession.getMapper(MyProfileDao.class);
        System.out.println("mid:"+mid);
        
		MemberDto dto = dao.myprofileview(mid);
		model.addAttribute("myprofile_view", dto);


	}// execute method

}// class
