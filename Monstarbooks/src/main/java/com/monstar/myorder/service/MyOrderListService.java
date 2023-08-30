package com.monstar.myorder.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.monstar.books.mypage.dao.MyOrderDao;
import com.monstar.books.mypage.dto.MyOrderDto;
import com.monstar.books.mypage.service.MyPageService;

@Service
public class MyOrderListService implements MyPageService {

    private SqlSession sqlSession;

    public MyOrderListService(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void execute(Model model) {
        System.out.println(">>myProfileOrderService");

        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");

        // 세션에서 회원 ID 가져오기
        HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("memberId");

        MyOrderDao dao = sqlSession.getMapper(MyOrderDao.class);

        // memberId를 이용하여 주문 내역 조회
        ArrayList<MyOrderDto> orderList = dao.getDeliverStatus(memberId);

        // 조회된 주문 내역을 모델에 추가
        model.addAttribute("orderList", orderList);
    }
}
