package com.monstar.books.m3pop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.m3pop.dao.QnaDao;


@Service
public class QnaDeleteService2 implements BServiceInter {

	private SqlSession sqlSession;
	
	public QnaDeleteService2(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}
	
	
	
	@Override
	public void execute(Model model) {
		System.out.println(">>> QnaDeleteService >>>");
		
//		map변환
		Map<String, Object> map = model.asMap();
		
//		map에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		

		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		String qnano = request.getParameter("qnano");
		dao.delete(qnano);

		
	}

}
