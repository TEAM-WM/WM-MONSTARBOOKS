package com.monstar.books.adorder.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adorder.dao.AdOrderDao;
import com.monstar.books.adorder.dto.AdOrderDto;
import com.monstar.books.vopage.SearchVo;

@Service
public class AdOrderListService implements AdOrderService {

	private SqlSession sqlSession;

	public AdOrderListService(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>AdOrderService");

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		SearchVo searchVo = (SearchVo) map.get("SearchVo");

		AdOrderDao dao = sqlSession.getMapper(AdOrderDao.class);

		String btitle = ""; // 도서명
		String memberno = ""; // 주문자 회원 id

		// brdtitle : 사용자가 선택한 검색 필드(도서명 또는 주문자(회원id))
		String[] brdtitle = request.getParameterValues("searchType");

		if (brdtitle != null) {
			for (int i = 0; i < brdtitle.length; i++) {
				System.out.println("검색:" + brdtitle[i]);
			}
		}

		// 변수에 저장
		if (brdtitle != null) {
			for (String val : brdtitle) {

				if (val.equals("btitle")) {// 제목 검색
					model.addAttribute("btitle", "true"); // 검색 체크 유지
					btitle = "btitle";

				} else if (val.equals("memberno")) { // 주문자 (회원 id) 검색
					model.addAttribute("memberno", "true"); // 검색 체크 유지
					memberno = "memberno";
				}
			}
		}

		// 이전 값 받아와 검색결과 유지하기.
		String bt = request.getParameter("btitle");
		String mb = request.getParameter("memberno");
//		memberno = "memberno";

		if (bt != null) {
			if (bt.equals("btitle")) {
				btitle = bt;
				model.addAttribute("btitle", "true");// 검색체크유지
			}
		}
		if (mb != null) {
			if (mb.equals("memberno")) {
				memberno = mb;
				model.addAttribute("memberno", "true");// 검색체크유지
			}
		}

		// 키워드(sk) 값 가져오기
		String searchKeyword = request.getParameter("sk");
		if (searchKeyword == null) {
			searchKeyword = "";
			model.addAttribute("sk", searchKeyword);
			System.out.println("키워드 (sk) " + searchKeyword);
		}

		// paging
		String strPage = request.getParameter("page");

		// 처음 null 처리
		if (strPage == null)
			strPage = "1";
		System.out.println("page :" + strPage);
		int page = Integer.parseInt(strPage);
		SearchVo searchvo = new SearchVo();
		searchvo.setPage(page);

		// 주문검색 (경우에 따라 4개의 경우의수로 총 갯수 구하기)
		int total = 0;
		if (btitle.equals("btitle") && memberno.equals("")) {
			total = dao.selectBoardTotCount1(searchKeyword);
		} else if (btitle.equals("") && memberno.equals("memberno")) {
			total = dao.selectBoardTotCount2(searchKeyword);
		} else if (btitle.equals("btitle") && memberno.equals("memberno")) {
			total = dao.selectBoardTotCount3(searchKeyword);
		} else if(btitle.equals("")&&memberno.equals("")) {
			total= dao.selectBoardTotCount4(searchKeyword);
		}

		System.out.println("totcnt :" + total);
		searchvo.pageCalculate(total);

		// 계산결과들 출력
		System.out.println("totrow:" + total);
		System.out.println("clickpage:" + searchvo.getPage());
		System.out.println("pageStart:" + searchvo.getPageStart());
		System.out.println("pageEnd:" + searchvo.getPageEnd());
		System.out.println("pageTot:" + searchvo.getTotPage());
		System.out.println("rowStart:" + searchvo.getRowStart());
		System.out.println("rowEnd:" + searchvo.getRowEnd());

		// pageVO에 정의해둔 페이징 글 번호 전달
		int rowStart = searchvo.getRowStart();
		int rowEnd = searchvo.getRowEnd();

		ArrayList<AdOrderDto> getOrderList = null;
		if (btitle.equals("btitle") && memberno.equals("")) {
			getOrderList = dao.getOrderList(rowStart, rowEnd, searchKeyword, "1");
		} else if (btitle.equals("") && memberno.equals("memberno")) {
			getOrderList = dao.getOrderList(rowStart, rowEnd, searchKeyword, "2");
		} else if (btitle.equals("btitle") && memberno.equals("memberno")) {
			getOrderList = dao.getOrderList(rowStart, rowEnd, searchKeyword, "3");
		} else if (btitle.equals("") && memberno.equals("")) {
			getOrderList = dao.getOrderList(rowStart, rowEnd, searchKeyword, "4");
		}
		
		model.addAttribute("getOrderList", getOrderList);
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVo", searchvo);

	}
}
		
