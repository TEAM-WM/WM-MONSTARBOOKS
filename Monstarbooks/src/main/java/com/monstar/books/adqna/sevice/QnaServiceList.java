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
import com.monstar.books.adqna.vopage.SearchVO;

@Service
public class QnaServiceList implements QnaService {

	@Autowired
	private SqlSession session;

	// 생성자
	public QnaServiceList(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>리스트 신호");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		SearchVO searchVO=(SearchVO) map.get("searchVO");
		
		QnaDao dao = session.getMapper(QnaDao.class);
		
//		paging
		String strPage=request.getParameter("page");
		if (strPage==null) 
			strPage="1";
			System.out.println(strPage);
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		
		int total=dao.selectQnatotCount();
		searchVO.pageCalculate(total);

//		paging 글 번호 전달
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		ArrayList<QnaDto> dto = dao.list(rowStart,rowEnd);
		model.addAttribute("list", dto);
		model.addAttribute("totRowcnt",total);
		model.addAttribute("searchVO", searchVO);

	}// override method

}// class