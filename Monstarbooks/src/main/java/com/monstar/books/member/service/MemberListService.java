package com.monstar.books.member.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.member.dao.MemberDao;
import com.monstar.books.member.dto.MemberDto;

@Service
public class MemberListService implements MemberService {
	@Autowired
	private SqlSession sqlSession;

	public MemberListService() {}

	public MemberListService(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		System.out.println(dao);
		// 디비에 접속해서 데이터 가져오기
		ArrayList<MemberDto> dto = dao.list();
		// 모델에 전달하기
		model.addAttribute("dto", dto);
	}// method override

}// class