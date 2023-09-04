package com.monstar.books.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.monstar.books.member.dao.MemberDao;

public class MemberIDCheckService implements MemberServiceMap{
	@Autowired
	private SqlSession sqlSession;
	
	public MemberIDCheckService() {}

	public MemberIDCheckService(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public Map<String, Object> execute(Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		// 맵 변환
		Map<String, Object> map = model.asMap();
		// 맵에서 request 추출
		String inputId = (String) map.get("id");
		System.out.println("인풋 아이디 : "+inputId);
		String isExist=dao.isExist(inputId);
		System.out.println("isExit 리턴타입 : "+isExist);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("isExist", isExist);
		
		return map2;
	}//method

}//