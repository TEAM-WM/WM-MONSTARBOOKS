package com.monstar.books.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.member.dto.MemberDto;
import com.monstar.books.mypage.dao.MyReviewDao;
import com.monstar.books.mypage.vopage.SearchVO;

@Service
@Primary
public class MyReviewListService implements MyPageService {

	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public MyReviewListService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 230825,26 [효슬] paging 추가
	@Override
	public void execute(Model model) {
		System.out.println(">>>마이리뷰리스트 신호");

		// map 변환, request 추출
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SearchVO searchVO = (SearchVO) map.get("searchVO");

//------------
//     로그인 사용자 ID 세션에서 받아오기
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("id");
//		MemberDto member = (MemberDto) request.getSession().getAttribute("user");
		
		System.out.println("id받아줘 :" + mid);
		
		MyReviewDao dao = sqlSession.getMapper(MyReviewDao.class);
//		dao.reviewlist()
//		searching
		String rtitle = "";
		String bookcategory = "";
		String rcontent = "";

		String[] brdtitle = request.getParameterValues("searchType");
		System.out.println("brdtitle:" + brdtitle);
		if (brdtitle != null) {// null이 아닐때만 돌아라
			for (int i = 0; i < brdtitle.length; i++) {
				System.out.println("brdtitle:" + brdtitle[i]);
			}
		}
//		변수에 저장
		if (brdtitle != null) {// null이 아닐때만 돌아라
			for (String var : brdtitle) {
				if (var.equals("rtitle")) {
					rtitle = "rtitle";
					model.addAttribute("rtitle", "true");
				} else if (var.equals("rcontent")) {
					rcontent = "rcontent";
					model.addAttribute("rcontent", "true");
				} else if (var.equals("bookcategory")) {
					bookcategory = "bookcategory";
					model.addAttribute("bookcategory", "true");
				}
			}
		}
		// 검색결과유지
		String rt = request.getParameter("rtitle");
		String rc = request.getParameter("rcontent");

//		변수에 저장
		if (rt != null) {// null이 아닐때만 돌아라
			if (rt.equals("rtitle")) {
				rtitle = rt;
				model.addAttribute("rtitle", "true");
			}
		}
		if (rc != null) {// null이 아닐때만 돌아라
			if (rc.equals("rcontent")) {
				rcontent = rc;
				model.addAttribute("rcontent", "true");
			}
		}

//		sk값가져오기		
		String searchKeyword = request.getParameter("sk");
		if (searchKeyword == null) {
			searchKeyword = "";
		}
		model.addAttribute("resk", searchKeyword);
		System.out.println("skkkkk:" + searchKeyword);

//		paging
		String strPage = request.getParameter("page");
//		처음 null처리
		if (strPage == null)
			strPage = "1";
		System.out.println("pagggg:" + strPage);
		int page = Integer.parseInt(strPage);
		searchVO.setPage(page);

//		글의 총갯수 구하기
//		int total=dao.selectBoardTotCount();

//		검색에 따른 총갯수 변형
		int total = 0;
//		4개의 경우의 수로 총갯수 구하기
		if (rtitle.equals("rtitle") && rcontent.equals("")) {
			total = dao.selectReviewListTotCount1(searchKeyword);
		} else if (rtitle.equals("") && rcontent.equals("rcontent")) {
			total = dao.selectReviewListTotCount2(searchKeyword);
		} else if (rtitle.equals("btitle") && rcontent.equals("rcontent")) {
			total = dao.selectReviewListTotCount3(searchKeyword);
		} else if (rtitle.equals("") && rcontent.equals("")) {
			total = dao.selectReviewListTotCount4(searchKeyword);
		}

		System.out.println("totcnt : " + total);
		searchVO.pageCalculate(total);
		// 계산결과들 출력
		System.out.println("totrow:" + total);
		System.out.println("clickpage:" + searchVO.getPage());
		System.out.println("pageStart:" + searchVO.getPageStart());
		System.out.println("pageEnd:" + searchVO.getPageEnd());
		System.out.println("pageTot:" + searchVO.getTotPage());
		System.out.println("rowStart:" + searchVO.getRowStart());
		System.out.println("rowEnd:" + searchVO.getRowEnd());

		// 페이징 글 번호전달
		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();

		
//		model.addAttribute("reviewList", dao.reviewList(rowStart, rowEnd, mid, no));
		model.addAttribute("reviewList", dao.reviewList(rowStart, rowEnd, mid));
		model.addAttribute("totRowCnt", total);
		model.addAttribute("searchVO", searchVO);

	}// execute method

}// class
