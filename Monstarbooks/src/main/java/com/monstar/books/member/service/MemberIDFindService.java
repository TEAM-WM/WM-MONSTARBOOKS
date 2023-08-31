package com.monstar.books.member.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.member.dao.MemberDao;
import com.monstar.books.member.dto.MemberDto;

@Service
public class MemberIDFindService implements MemberService {
	@Autowired
	private SqlSession sqlSession;

	public MemberIDFindService() {}

	public MemberIDFindService(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		System.out.println("아이디 찾기 dao : "+dao);
		Map<String, Object> map = model.asMap();
		// 맵에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		MemberDto dto = new MemberDto();
		
			//이름, 전화번호로 아이디를 찾을때
			if(name!=null && email !=null) {
				dto.setMemail(email);
				dto.setMname(name);
				model.addAttribute("info",email);
			}else {
				dto.setMname(name);
				dto.setMtel(tel);
				model.addAttribute("info",tel);
			}

			//dao 에서 dto 인자로 받아서 id 찾아오기
			ArrayList<MemberDto> idList=dao.idSearch(dto);
			model.addAttribute("name",name);
			model.addAttribute("dto",idList);
	}// method override

}// class