package com.monstar.books.adreview.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adqna.dto.QnaDto;
import com.monstar.books.adreview.dao.ReviewDao;
import com.monstar.books.adreview.dto.ReviewDto;
import com.monstar.books.adreview.vopage.SearchVO;
@Primary
@Service
public class ReviewServiceList implements ReviewService {
	
	@Autowired
	private SqlSession session;

	// 생성자
	public ReviewServiceList(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
	    System.out.println(">>>리뷰목록 신호");
	    
	    Map<String, Object> map = model.asMap();
	    HttpServletRequest request = (HttpServletRequest) map.get("request");
	    SearchVO searchVO=(SearchVO) map.get("searchVO");
	    
	    ReviewDao dao = session.getMapper(ReviewDao.class);
	    
//		검색
		String btitle = "";
		String mname = "";
		String[] brdtitle = request.getParameterValues("searchType");
		System.out.println("brdtitle : " + brdtitle);
		if (brdtitle != null) {
			for (int i = 0; i < brdtitle.length; i++) {
				System.out.println("brdtitle : " + brdtitle[i]);
			}
		}
//	      변수 저장
		if (brdtitle != null) {
			for (String var : brdtitle) {
				if (var.equals("btitle")) {
					btitle = "btitle";
					model.addAttribute("btitle", "true");
				} else if (var.equals("mname")) {
					mname = "mname";
					model.addAttribute("mname", "true");
				}
			}
		}
//	      검색결과 유지
		String bt = request.getParameter("btitle");
		String mn = request.getParameter("mname");
//	      변수 저장
		if (bt != null) {
			if (bt.equals("btitle")) {
				btitle =bt;
				model.addAttribute("btitle", "true");
			}
		}
		if (mn != null) {
			if (mn.equals("mname")) {
				mname = mn;
				model.addAttribute("mname", "true");
			}
		}

//	    sk값 가져오기
		String searchKeyword = request.getParameter("sk");
		if (searchKeyword == null) {
			searchKeyword = "";
		}
		model.addAttribute("resk", searchKeyword);
		
		System.out.println("sk:" + searchKeyword);
		
//		paging
		String strPage=request.getParameter("page");
		if (strPage==null) 
			strPage="1";
			System.out.println(strPage);
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		
//		검색어에 따른 총 갯수 변화
		int total = 0;
//		4개의 경우의 수로 총갯수 구하기
		if (btitle.equals("btitle") && mname.equals("")) {
			total = dao.selectBoardTotCount1(searchKeyword);
		} else if (btitle.equals("") && mname.equals("mname")) {
			total = dao.selectBoardTotCount2(searchKeyword);
		} else if (btitle.equals("btitle") && mname.equals("mname")) {
			total = dao.selectBoardTotCount3(searchKeyword);
		} else if (btitle.equals("") && mname.equals("")) {
			total = dao.selectBoardTotCount4(searchKeyword);
		}
		System.out.println("tot" + total);
		
		searchVO.pageCalculate(total);
		
//		paging 글 번호 전달
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		ArrayList<ReviewDto> review=null;

		if (btitle.equals("btitle") && mname.equals("")) {
			model.addAttribute("review", dao.review(rowStart, rowEnd, searchKeyword, "1"));
		} else if (btitle.equals("") && mname.equals("mname")) {
			model.addAttribute("review", dao.review(rowStart, rowEnd, searchKeyword, "2"));
		} else if (btitle.equals("btitle") && mname.equals("mname")) {
			model.addAttribute("review", dao.review(rowStart, rowEnd, searchKeyword, "3"));
		} else if (btitle.equals("") && mname.equals("")) {
			model.addAttribute("review", dao.review(rowStart, rowEnd, searchKeyword, "4"));
		}


		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVO", searchVO);
	}


}// class
