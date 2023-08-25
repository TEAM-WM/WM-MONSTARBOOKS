package com.monstar.books.adnotice.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.monstar.books.adnotice.dao.AdNoticeDao;
import com.monstar.books.adnotice.dto.AdNoticeDto;

public class AdNoticeUpdateServiceList implements AdNoticeService {
	private SqlSession sqlSession;
	
	public AdNoticeUpdateServiceList(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		// Map 변환
		Map<String, Object> map = model.asMap();
		// Map에서 Request값 추출하기
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String noticeno = request.getParameter("noticeno");
		String deleted = request.getParameter("deleted");
		String ntitle = request.getParameter("ntitle");
		String ncontent = request.getParameter("ncontent");
//		String nfilesrc = request.getParameter("nfilesrc");
		AdNoticeDao dao = sqlSession.getMapper(AdNoticeDao.class);
		
//		System.out.println(noticeno + "," + ntitle);
		
		dao.update(noticeno,deleted,ntitle,ncontent);
		
		
		
	}

}
