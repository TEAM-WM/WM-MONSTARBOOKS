package com.monstar.books.adorder.sevice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.monstar.books.adorder.dao.AdOrderDao;

public class AdupdateOrderStatusService implements AdOrderService {
    
    private SqlSession sqlSession;
    
    public AdupdateOrderStatusService(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void execute(Model model) {
        System.out.println(">>주문상황 업데이트");
        
        Map<String, Object> map = model.asMap();
		HttpServletRequest request = 
				(HttpServletRequest) map.get("request");

        String orderNoStr = request.getParameter("orderNo");
        String newStatus= request.getParameter("newStatus");
       
        
        int orderNo = 0;
        
        try {
            orderNo = Integer.parseInt(orderNoStr);
        } catch (NumberFormatException e) {
            System.out.println("숫자 변환 불가: " + orderNoStr);
        }
        System.out.println(newStatus);
        System.out.println(orderNo);
        // 필요한 DAO 등의 작업을 수행하고, 결과를 result로 받음
        AdOrderDao dao = sqlSession.getMapper(AdOrderDao.class);
        
       dao.adupdateOrderStatus(orderNo,newStatus);
       System.out.println("dao"+dao);
       
       
       model.addAttribute("orderNo",orderNo);
       System.out.println("orderno");
       model.addAttribute("newStatus",newStatus);
       System.out.println(newStatus);
       


    }
}
