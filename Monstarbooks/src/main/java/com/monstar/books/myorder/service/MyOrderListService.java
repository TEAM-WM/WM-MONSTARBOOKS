package com.monstar.books.myorder.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adqna.vopage.SearchVO;
import com.monstar.books.mypage.dao.MyOrderDao;
import com.monstar.books.mypage.dto.MyOrderDto;
import com.monstar.books.mypage.service.MyPageService;
import com.monstar.books.vopage.SearchVo;

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
        String memberId = (String) session.getAttribute("id");
        System.out.println("id :"+memberId);

        
        MyOrderDao dao = sqlSession.getMapper(MyOrderDao.class);
        
        //페이징 시작
        String strPage = request.getParameter("page");
        
        if (strPage==null) {
        	strPage="1";
        }
        System.out.println("page"+strPage);
        int page = Integer.parseInt(strPage);
        
        SearchVo searchvo=new SearchVo();
        searchvo.setPage(page);
        
        int total=0;
        
        total = dao.getOrderCount(memberId);
        searchvo.pageCalculate(total);
        
        int rowStart=searchvo.getRowStart();
        int rowEnd=searchvo.getRowEnd();
        
        

        // memberId를 이용하여 주문 내역 조회
        ArrayList<MyOrderDto> orderList = dao.getDeliverStatus(memberId);
        


        // 조회된 주문 내역을 모델에 추가
        model.addAttribute("orderList", orderList);
        model.addAttribute("searchVo", searchvo);
        model.addAttribute("totRowcnt",total);
    }
}
