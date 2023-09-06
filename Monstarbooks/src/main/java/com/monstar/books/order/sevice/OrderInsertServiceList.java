package com.monstar.books.order.sevice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.monstar.books.order.dao.OrderDao;

@Service
public class OrderInsertServiceList implements OrderService {

	@Autowired
	private SqlSession session;

	// 생성자
	public OrderInsertServiceList(SqlSession session) {
		this.session = session;
	}

	@Transactional
	@Override
	public void execute(Model model) {
		
		System.out.println(">>>주문 완료");
		
//		map 변환, request 추출
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		OrderDao dao = session.getMapper(OrderDao.class);
		
		String memberno = request.getParameter("memberno");
		String ototalprice = request.getParameter("ototalprice");
		String opay = request.getParameter("payment");
			
		String[] bookno = request.getParameterValues("bookno");
		String[] opricesell = request.getParameterValues("opricesell");
		String[] ocount = request.getParameterValues("ocount");
		
//		System.out.println("memberno : "+ memberno);
//		System.out.println(ototalprice);
//		System.out.println(opay);
		
		String daddress1 = request.getParameter("daddress1");
		String daddress2 = request.getParameter("daddress2");
		String daddress3 = request.getParameter("daddress3");
		String dzipcode = request.getParameter("dzipcode");
		String dtel = request.getParameter("dtel");
		String dname = request.getParameter("dname");
		
		System.out.println(daddress1+", "+daddress2+", "+daddress3+", "
				+dzipcode+", "+dtel+", "+dname);
		
		for (int i = 0; i < bookno.length; i++) {
			System.out.println(bookno[i] +", "+ opricesell[i] +", "+ ocount[i]);	
			// 주문 상세 테이블에 추가
			dao.orderInsetDetail(bookno[i],opricesell[i],ocount[i]);
		}
		
		//주문 테이블에 추가
		dao.orderInsert(memberno,ototalprice,opay);//memberno 추후 수정
		
		//배송 테이블에 추가
		dao.deliveryInsert(memberno,daddress1,daddress2,daddress3,dzipcode,dtel,dname);

	}// override method

}// class