package com.monstar.books.cart.sevice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.cart.dao.CartDao;

@Service
public class CntUpdateServiceList implements CartService {

	@Autowired
	private SqlSession session;

	// 생성자
	public CntUpdateServiceList(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>수량 감소");
		
//		map 변환
		Map<String, Object> map = model.asMap();
		
//		map에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String cnt = request.getParameter("ccount");
		String cartno = request.getParameter("cartno");
		System.out.println(cnt);
		CartDao dao = session.getMapper(CartDao.class);
		
		dao.cntUpdate(cnt,cartno); //memberno 추후 추가


	}// override method

}// class