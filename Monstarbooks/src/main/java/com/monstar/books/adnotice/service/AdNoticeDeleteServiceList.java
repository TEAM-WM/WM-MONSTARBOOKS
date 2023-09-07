package com.monstar.books.adnotice.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.monstar.books.adnotice.dao.AdNoticeDao;

public class AdNoticeDeleteServiceList implements AdNoticeService {
	private SqlSession sqlSession;
	
	public AdNoticeDeleteServiceList(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		
//		System.out.println("deleteService");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String noticeno = request.getParameter("noticeno");
		
//		System.out.println("noticeno : " + noticeno);
		
		AdNoticeDao dao = sqlSession.getMapper(AdNoticeDao.class);
		dao.delete(noticeno);
		
	}

}
