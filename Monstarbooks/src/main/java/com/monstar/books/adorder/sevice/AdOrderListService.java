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
		HttpServletRequest request = 
				(HttpServletRequest) map.get("request");
		
		// paging
		String strPage = request.getParameter("page");

		// 처음 null 처리
		if (strPage == null) {
			strPage = "1";
		}
		System.out.println("page :" + strPage);
		int page = Integer.parseInt(strPage);
		
		//검색 vo에 페이지 값 담아주기
		SearchVo searchvo = new SearchVo();
		searchvo.setPage(page);
		

		AdOrderDao dao = sqlSession.getMapper(AdOrderDao.class);

		String productName = ""; // 도서명
		String memberId = ""; // 주문자 회원 id
		
		// brdtitle : 사용자가 선택한 검색 필드(도서명 또는 주문자(회원id))
		String[] brdtitle = request.getParameterValues("searchType");
		System.out.println("brdtitle : " + brdtitle);
		//출력되는지 확인

		if (brdtitle != null) {
			for (int i = 0; i < brdtitle.length; i++) {
				System.out.println("검색조건:" + brdtitle[i]);
			}
		}

		// 변수에 저장
		if (brdtitle != null) {
			for (String val : brdtitle) {

				if (val.equals("productName")) {// 도서명 검색
					model.addAttribute("productName", "true"); // 검색 체크 유지
					productName = "productName";
					System.out.println("도서명 검색:"+productName);

				} else if (val.equals("memberId")) { // 주문자 (회원 id) 검색
					model.addAttribute("memberId", "true"); // 검색 체크 유지
					memberId = "memberId";
					System.out.println("주문자 검색:"+memberId);
				}
			}
		}

		// 이전 값 받아와 검색결과 유지하기.
		String pn = request.getParameter("productName");
		String mid = request.getParameter("memberId");
		


		if (pn != null) {
			if (pn.equals("productName")) {
				productName = pn;
				model.addAttribute("productName", "true");// 검색체크유지
				
			}
		}
		if (mid != null) {
			if (mid.equals("memberId")) {
				memberId = mid;
				model.addAttribute("memberId", "true");// 검색체크유지
				
			}
		}

		// 키워드(sk) 값 가져오기
		String searchKeyword = request.getParameter("sk");
		System.out.println("sk값이 잘 오나 :"+searchKeyword);
		if (searchKeyword == null) {
			searchKeyword = "";
	//		model.addAttribute("sk", searchKeyword);
			System.out.println("검색어 (sk) " + searchKeyword);
		}



		// 주문검색 (경우에 따라 4개의 경우의수로 총 갯수 구하기)
		int total = 0;
		if (productName.equals("productName") && memberId.equals("")) {
			total = dao.selectBoardTotCount1(searchKeyword);
		} else if (productName.equals("") && memberId.equals("memberId")) {
			total = dao.selectBoardTotCount2(searchKeyword);
		} else if (productName.equals("productName") && memberId.equals("memberno")) {
			total = dao.selectBoardTotCount3(searchKeyword);
		} else if(productName.equals("")&&memberId.equals("")) {
			total= dao.selectBoardTotCount4(searchKeyword);
		}

		System.out.println("totcnt :" + total);
		searchvo.pageCalculate(total);

//		// 계산결과들 출력
//		System.out.println("totrow:" + total);
//		System.out.println("clickpage:" + searchvo.getPage());
//		System.out.println("pageStart:" + searchvo.getPageStart());
//		System.out.println("pageEnd:" + searchvo.getPageEnd());
//		System.out.println("pageTot:" + searchvo.getTotPage());
//		System.out.println("rowStart:" + searchvo.getRowStart());
//		System.out.println("rowEnd:" + searchvo.getRowEnd());

		// pageVO에 정의해둔 페이징 글 번호 전달
		int rowStart = searchvo.getRowStart();
		int rowEnd = searchvo.getRowEnd();

		ArrayList<AdOrderDto> getOrderList = null;
		if (productName.equals("productName") && memberId.equals("")) {
		    getOrderList = dao.getOrderList(rowStart, rowEnd, searchKeyword, "1");
		} else if (productName.equals("") && memberId.equals("memberId")) {
		    getOrderList = dao.getOrderList(rowStart, rowEnd, searchKeyword, "2");
		} else if (productName.equals("productName") && memberId.equals("memberId")) {
		    getOrderList = dao.getOrderList(rowStart, rowEnd, searchKeyword, "3");
		} else if (productName.equals("") && memberId.equals("")) {
		    getOrderList = dao.getOrderList(rowStart, rowEnd, searchKeyword, "4");
		}

		model.addAttribute("getOrderList", getOrderList);
		model.addAttribute("sk", searchKeyword);
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVo", searchvo);

	}
}
		
