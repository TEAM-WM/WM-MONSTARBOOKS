package com.monstar.books.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.member.dao.MemberDao;
import com.monstar.books.member.dto.MemberDto;

@Service
public class MemberListStatusService implements MemberService {
	@Autowired
	private SqlSession sqlSession;

	public MemberListStatusService() {}

	public MemberListStatusService(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		// asMap = 인덱스 번호도 같이 가져올수있다.
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String status = request.getParameter("status");
		String no = request.getParameter("no");
		
		MemberDto dto = new MemberDto();
		dto.setMauthority(status);
		dto.setMemberno(Integer.parseInt(no));
		System.out.println("변경할 권한"+status);
		
		dao.updateStatus(dto);
	}// method override

}// class