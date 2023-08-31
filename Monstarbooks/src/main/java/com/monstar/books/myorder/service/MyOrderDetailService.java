package com.monstar.books.myorder.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.monstar.books.adorder.dao.AdOrderDao;
import com.monstar.books.adorder.dto.AdOrderDto;
import com.monstar.books.mypage.service.MyPageService;

public class MyOrderDetailService implements MyPageService {
	
	  private SqlSession sqlSession;

	    public MyOrderDetailService(SqlSession sqlSession) {
	        this.sqlSession = sqlSession;
	    }


	@Override
	public void execute(Model model) {
		System.out.println(">>MyOrderDetailService");
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		  String orderNoStr = request.getParameter("orderNo");

	        int orderNo = 0;

	        try {
	            orderNo = Integer.parseInt(orderNoStr);
	        } catch (NumberFormatException e) {
	            System.out.println("숫자 변환 불가: " + orderNoStr);
	        }
	        
	        AdOrderDao dao = sqlSession.getMapper(AdOrderDao.class);
	        
	        if (orderNo != 0) {
	            // 주문 상세 정보와 결제 정보를 각각 받아옴
	            List<AdOrderDto> orderDetailDto = dao.getorderDetail(orderNo);
	            List<AdOrderDto> paymentDetailDto = dao.getpaymentDetail(orderNo);
	            List<AdOrderDto> productDetailDto = dao.getproductDetail(orderNo);
	            
	            System.out.println("orderDetailDto:" + orderDetailDto);
	            System.out.println("paymentDetailDto:" + paymentDetailDto);
	            System.out.println("productDetailDto" +productDetailDto);
	            
	            // 각각의 정보를 model에 저장
	            model.addAttribute("orderDetail", orderDetailDto);
	            model.addAttribute("paymentDetail", paymentDetailDto);
	            model.addAttribute("productDetail",productDetailDto);
	        }
	    }
	}

