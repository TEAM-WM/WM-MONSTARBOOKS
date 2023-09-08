package com.monstar.books.order.sevice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.monstar.books.order.dao.OrderDao;

@Service
public class OrderInsertServiceList implements OrderService {

	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public OrderInsertServiceList(SqlSession session) {
		this.sqlSession = session;
	}

	@Transactional
	@Override
	public void execute(Model model) {
		
		System.out.println(">>>주문 완료");
		
//		map 변환, request 추출
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		OrderDao dao = sqlSession.getMapper(OrderDao.class);
		
		// 세션에서 회원 ID 가져오기
        HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("id");
        System.out.println("id :"+memberId);
        
        int memberno = dao.getMemberno(memberId);		
        System.out.println("memberno :"+memberno);
		
		String ototalprice = request.getParameter("ototalprice");
		String opay = request.getParameter("payment");
			
		String[] bookno = request.getParameterValues("bookno");
		String[] opricesell = request.getParameterValues("opricesell");
		String[] ocount = request.getParameterValues("ocount");

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
			
			//카트 테이블에서 삭제
			dao.cartDelete(bookno[i],memberno);
		}
		
		// 사용한 coupon_member 테이블의 cpno
		String usedCpno = request.getParameter("usedCpno");
		System.out.println("usedCpo : " + usedCpno);
		
		// 쿠폰사용하지 않으면 자동으로 0원 할인쿠폰 적용
		if(usedCpno == "") {
			System.out.println("쿠폰사용안함");
			usedCpno = dao.zeroCpno(memberno);
		}
		// 주문 테이블에 추가
		dao.orderInsert(memberno,usedCpno,ototalprice,opay);
		
		// 배송 테이블에 추가
		dao.deliveryInsert(memberno,daddress1,daddress2,daddress3,dzipcode,dtel,dname);

		// 쿠폰 사용불가로 업데이트
		dao.couponUse(usedCpno,memberno);
		
		
	}// override method

}// class