package com.monstar.books.m3pop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.m3pop.dao.QnaDao;
import com.monstar.books.m3pop.dto.QnaDto;



@Service
public class QnaContentViewService implements BServiceInter{
	private SqlSession sqlSession;	
	
	public QnaContentViewService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		System.out.println(">>>BContentViewService");
		
//		map으로변환
		Map<String, Object> map=model.asMap();
		//map에서 request 빼오기
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		int qnano = Integer.parseInt(request.getParameter("qnano")) ;
		System.out.println("qnano"+qnano);
		System.out.println("변형된 qnano"+qnano);
		QnaDao dao=sqlSession.getMapper(QnaDao.class);
		//dao.upHit(bid);
		//contentView
		
		QnaDto dtos = dao.contentView(qnano);
		model.addAttribute("qna", dtos);
		
	}

}
