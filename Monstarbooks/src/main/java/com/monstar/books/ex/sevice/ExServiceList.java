package com.monstar.books.ex.sevice;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.ex.dao.ExDao;
import com.monstar.books.ex.dto.ExDto;

@Service
public class ExServiceList implements ExService {

	@Autowired
	private SqlSession session;

	// 생성자
	public ExServiceList(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>리스트 신호");
		
		ExDao dao = session.getMapper(ExDao.class);
		ArrayList<ExDto> dto = dao.list();
		model.addAttribute("dto", dto);

	}// override method

}// class