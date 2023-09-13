package com.monstar.books.adcoupon.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adcoupon.dao.AdCouponDao;
import com.monstar.books.adcoupon.dto.AdCouponDto;
import com.monstar.books.vopage.SearchVo;

@Service
public class AdCouponListService implements AdCouponService {

	private SqlSession sqlSession;

	public AdCouponListService(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>AdCouponService");

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SearchVo searchvo = (SearchVo) map.get("searchVo");

		// 페이징 처리
		String strPage = request.getParameter("page");

		if (strPage == null) {
			strPage = "1";
		}
		System.out.println("page : " + strPage);
		int page = Integer.parseInt(strPage);

		// 검색 처리
		searchvo.setPage(page);

		AdCouponDao dao = sqlSession.getMapper(AdCouponDao.class);

		String cpname = ""; // 쿠폰 이름
		String cpdescription = ""; // 쿠폰 설명

		String[] searchfiled = request.getParameterValues("searchType");

		if (searchfiled != null) {
			for (int i = 0; i < searchfiled.length; i++) {
				System.out.println("검색조건 :" + searchfiled[i]);
			}
		}

		if (searchfiled != null) {
			for (String val : searchfiled) {

				if (val.equals("cpname")) { // 쿠폰이름 검색
					model.addAttribute("cpname", "true");
					cpname = "cpname";
				} else if (val.equals("cpdescription")) { // 쿠폰설명 검색
					model.addAttribute("cpdescription", "true");
					cpdescription = "cpdescription";
				}
			}
		}

		// 이전 값 받아와 검색 결과 유지
		String cpn = request.getParameter("cpname");
		String cpdes = request.getParameter("cpdescription");

		if (cpn != null) {
			if (cpn.equals("cpname")) {
				cpname = cpn;
				model.addAttribute("cpname", "true"); // 검색 체크 유지
			}
		}
		if (cpdes != null) {
			if (cpdes.equals("cpdescription")) {
				cpdescription = cpdes; // cpdescription 변수에 대입해야 합니다.
				model.addAttribute("cpdescription", "true"); // 검색 체크 유지
			}
		}

		// 키워드(sk)값 가져오기
		String searchKeyword = request.getParameter("sk");
		System.out.println("sk값이 잘 오고 있는지 : " + searchKeyword);
		if (searchKeyword == null) {
			searchKeyword = "";
			System.out.println("검색어 (sk) " + searchKeyword);
		}
		// 검색에 따른 페이징

		int total = 0;
		
		  if (cpname.equals("cpname") && cpdescription.equals("")) { total =
		  dao.selectCouponTotCount1(searchKeyword); } else if (cpname.equals("") &&
		  cpdescription.equals("cpdescription")) { total =
		  dao.selectCouponTotCount2(searchKeyword); } else if (cpname.equals("") &&
		  cpdescription.equals("")) { total = dao.selectCouponTotCount3(searchKeyword);
		  }
		 
		System.out.println("total :" + total);

		searchvo.pageCalculate(total);

		// pageVO에 정의해둔 페이징 글 번호 전달
		int rowStart = searchvo.getRowStart();
		System.out.println("rowStart :" + rowStart);
		int rowEnd = searchvo.getRowEnd();
		System.out.println("rowEnd :" + rowEnd);

		//검색
		ArrayList<AdCouponDto> getCouponList = null;
		if (cpname.equals("cpname") && cpdescription.equals("")) {
			getCouponList = dao.selectcpname(rowStart, rowEnd, searchKeyword);
		} else if (cpname.equals("") && cpdescription.equals("cpdescription")) {
			getCouponList = dao.selectcpdescription(rowStart, rowEnd, searchKeyword);
		} else if (cpname.equals("") && cpdescription.equals("")) {
			getCouponList = dao.getCouponList(rowStart, rowEnd, searchKeyword);
		}

		model.addAttribute("getCouponList", getCouponList);
		System.out.println("검색:" + getCouponList);

		model.addAttribute("sk", searchKeyword);
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVo", searchvo);
	}
}
