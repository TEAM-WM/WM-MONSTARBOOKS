package com.monstar.books.myorder.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyOrderDao;
import com.monstar.books.mypage.dto.MyOrderDto;
import com.monstar.books.mypage.service.MyPageService;
import com.monstar.books.mypage.vopage.SearchVO;

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
        
        SearchVO searchvo=new SearchVO();
        searchvo.setPage(page);
        
        int total=0;
        
        total = dao.getOrderCount(memberId);
        searchvo.pageCalculate(total);
        
     // pageVO에 정의해둔 페이징 글 번호 전달
     		int rowStart = searchvo.getRowStart();
     		System.out.println("rowStart :" + rowStart);
     		int rowEnd = searchvo.getRowEnd();
     		System.out.println("rowEnd :" + rowEnd);
        
        

        // memberId를 이용하여 주문 내역 조회
        ArrayList<MyOrderDto> orderList = dao.getDeliverStatus(rowStart, rowEnd, memberId);
        


        // 조회된 주문 내역을 모델에 추가
        model.addAttribute("orderList", orderList);
        model.addAttribute("searchVo", searchvo);
        model.addAttribute("totRowcnt",total);
    }
}
