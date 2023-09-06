package com.monstar.books.member.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.member.dao.MemberDao;
import com.monstar.books.member.dto.MemberDto;
import com.monstar.books.mypage.dao.MyOrderDao;
import com.monstar.books.mypage.dto.MyOrderDto;
import com.monstar.books.vopage.SearchVo;

@Service
public class AdMemberDetailService implements MemberService {
	@Autowired
	private SqlSession sqlSession;

	public AdMemberDetailService() {}

	public AdMemberDetailService(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		// asMap = 인덱스 번호도 같이 가져올수있다.
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int memberno = Integer.parseInt(request.getParameter("memberNo"));
		
		System.out.println(memberno);
		
		MemberDto dto = dao.getData2(memberno);
		
		String mfavorite = dto.getMfavorite();
		if (mfavorite == null) {
			mfavorite = "";
		}
		String[] favoriteList=mfavorite.split(",");
		for (int i = 0; i < favoriteList.length; i++) {
			System.out.println(favoriteList[i]);
		}
		
		model.addAttribute("favorite",favoriteList);
		model.addAttribute("dto",dto);
		

        MyOrderDao myOrderDao = sqlSession.getMapper(MyOrderDao.class);
        
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
        
        total = myOrderDao.getOrderCount(dto.getMid());
        searchvo.pageCalculate(total);
        
        int rowStart=searchvo.getRowStart();
        int rowEnd=searchvo.getRowEnd();
        
        

        // memberId를 이용하여 주문 내역 조회
        ArrayList<MyOrderDto> orderList = myOrderDao.getDeliverStatus(rowStart,rowEnd,dto.getMid());
        


        // 조회된 주문 내역을 모델에 추가
        model.addAttribute("orderList", orderList);
        model.addAttribute("searchVo", searchvo);
        model.addAttribute("totRowcnt",total);
	}// method override

}// class