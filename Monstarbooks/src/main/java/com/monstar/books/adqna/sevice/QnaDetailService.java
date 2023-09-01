package com.monstar.books.adqna.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adqna.dao.QnaDao;
import com.monstar.books.adqna.dto.QnaDto;
@Service
public class QnaDetailService implements QnaService{

	@Autowired
	private SqlSession session;

	// 생성자
	public QnaDetailService(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>>디테일 신호");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		int qnano = Integer.parseInt(request.getParameter("qnano"));
		QnaDao dao=session.getMapper(QnaDao.class);
		
		QnaDto dto=dao.qnadetail(qnano);
		
//		qcontent 내용확인
//		for (QnaDto qnaDto : dto) {
//			System.out.println(qnaDto.getQcontent());
//		}
		model.addAttribute("qnadetail",dto);
		
	}

}
