package com.monstar.books.mypage.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyCouponDao;
import com.monstar.books.mypage.vopage.SearchVO;
import com.monstar.books.order.dto.CouponMemberDto;

@Service
@Primary
public class MyCouponListService implements MyPageService {

	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public MyCouponListService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//[효슬] 마이페이지 쿠폰함 목록
	@Override
	public void execute(Model model) {
		System.out.println(">>>마이쿠폰리스트 신호");

		// map 변환, request 추출
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SearchVO searchVO = (SearchVO) map.get("searchVO");
		
		MyCouponDao dao = sqlSession.getMapper(MyCouponDao.class);
		
//     로그인 사용자 회원번호 세션에서 받아오기
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("id");
		Integer no = (Integer) session.getAttribute("memberNumber");
		System.out.println("member :" + no);
		System.out.println("id :" + mid);

//		페이징 paging
		String strPage=request.getParameter("page");
//		처음 null처리
		if(strPage==null)
			strPage="1";
		System.out.println("pagggg:"+strPage);
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		
//		글의 총갯수 구하기
//		int total=dao.couponboxTotCount(mid);
//		int total=dao.couponboxTotCount();
		int total=dao.couponboxTotCount(no);
		
		System.out.println("totcnt : "+total);
		searchVO.pageCalculate(total);
		//계산결과들 출력
		System.out.println("totrow:"+total);
		System.out.println("clickpage:"+searchVO.getPage());
		System.out.println("pageStart:"+searchVO.getPageStart());
		System.out.println("pageEnd:"+searchVO.getPageEnd());
		System.out.println("pageTot:"+searchVO.getTotPage());
		System.out.println("rowStart:"+searchVO.getRowStart());
		System.out.println("rowEnd:"+searchVO.getRowEnd());
		
		//패이징 글 번호전달
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
//		int cpno = Integer.parseInt(request.getParameter("cpno"));
//		System.out.println("cpno :" + cpno);
		
		List<CouponMemberDto> couponMember = dao.myCoupon(rowStart,rowEnd,no);		
		model.addAttribute("mcoupon", couponMember);
		
		
	}// execute method

}// class
