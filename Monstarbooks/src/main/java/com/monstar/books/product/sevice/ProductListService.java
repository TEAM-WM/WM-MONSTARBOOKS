package com.monstar.books.product.sevice;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.ex.dao.ExDao;
import com.monstar.books.ex.dto.ExDto;
import com.monstar.books.product.dao.ProductDao;
import com.monstar.books.product.dto.BookDto;
import com.monstar.books.product.vopage.SearchVO;

@Service
@Primary
public class ProductListService implements ProductService {

	@Autowired
	private SqlSession session;

	// 생성자
	public ProductListService(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>> LIST SERVICE >>>");
		
		ProductDao dao = session.getMapper(ProductDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SearchVO searchVO = (SearchVO) map.get("searchVO");
		String searchType = request.getParameter("searchType");
					
		
		// 검색
		// 저장할 변수 선언
		String bisbn = "";
		String btitle = "";
		
		String[] brdtitle = request.getParameterValues("searchType");
		System.out.println("mtitle : " + Arrays.toString(brdtitle));
		
		// 출력되는지 테스트
		if (brdtitle != null) {
			for (int i = 0; i < brdtitle.length; i++) {
				System.out.println("mtitle : " + brdtitle[i]);
			}
		}
		
		// 선택 검색조건 변수에 저장
		if (brdtitle != null) {// null 이 아닐때만 돌아주세용
			for (String var : brdtitle) {
				if (var.equals("bisbn")) {
					bisbn = "bisbn";
					model.addAttribute("bisbn","true");
				} else if (var.equals("btitle")) {
					btitle = "btitle";
					model.addAttribute("btitle","true");
				}
			}
		}
		
		//검색결과 유지
		String bis = request.getParameter("bisbn");
		String bti = request.getParameter("btitle");
		
		//변수에 저장 
		if (bis != null) {
			if(bis.equals("btitle")) {
				bisbn = bis;
				model.addAttribute("bisbn", "true");
			}
		}
		if (bti != null) {
			if(bti.equals("bcontent")) {
				btitle = bti;
				model.addAttribute("btitle", "true");
			}
		}
		
		//sk값(검색어) 가져오기
		String searchKeyword = request.getParameter("sk");
		if (searchKeyword == null) {
			searchKeyword = "";
		}
		
		//검색창에 방금 입력한 조건과 검색어가 남아있도록.
		model.addAttribute("resk", searchKeyword);
		//model에 검색조건 선택된거는 트루 넣어둠.
				
		//paging 시작
		String strPage = request.getParameter("page");
		
		//처음 list null처리
		if(strPage==null) {
			strPage = "1";
		}
		
		System.out.println("pagggggg:"+strPage);
		int page = Integer.parseInt(strPage);
		searchVO.setPage(page); //페이지 전달
		
//		검색에 따른 총갯수 변형
		int total=0;
//		4개의 경우의 수로 총갯수 구하기
		if(bisbn.equals("bisbn")&& btitle.equals("")) {
			total=dao.selectBoardTotCount1(searchKeyword);
		}else if(bisbn.equals("")&& btitle.equals("btitle")) {
			total=dao.selectBoardTotCount2(searchKeyword);
		}else if(bisbn.equals("bisbn")&& btitle.equals("btitle")) {
			total=dao.selectBoardTotCount3(searchKeyword);
		}else if(bisbn.equals("")&& btitle.equals("")) {
			total=dao.selectBoardTotCount4(searchKeyword);
		}
		
		System.out.println("totcnt: "+total);
		searchVO.pageCalculate(total);
		
		//계산 결과들 출력
		System.out.println("totrow: "+total);
		System.out.println("clickpage: "+searchVO.getPage());
		System.out.println("pageStart: "+searchVO.getPageStart());
		System.out.println("pageEnd: "+searchVO.getPageEnd());
		System.out.println("pageTot: "+searchVO.getTotPage());
		System.out.println("rowStart: "+searchVO.getRowStart());
		System.out.println("rowEnd: "+searchVO.getRowEnd());		
		
		//페이징 글 번호 전달
		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();
		
		
//		ArrayList<BookDto> dto = dao.list();
//		ArrayList<BookDto> dto = dao.list(rowStart, rowEnd);
		ArrayList<BookDto> dto = null;
		
//		if("bookno".equals(searchType)) {
//			dto = dao.searchByBookNo(Integer.parseInt(searchKeyword), rowStart, rowEnd);
//		} else if("btitle".equals(searchType)) {
//			dto = dao.searchByBookTitle(searchKeyword, rowStart, rowEnd);			
//		} else if(searchKeyword.isEmpty()){
//			dto = dao.searchNoType(searchKeyword, rowStart, rowEnd);
//		} 
		
		if(bisbn.equals("bisbn") && btitle.equals("")) {
			model.addAttribute("dto",dao.list(rowStart,rowEnd,searchKeyword,"1"));
		}else if(bisbn.equals("")&& btitle.equals("btitle")) {
			model.addAttribute("dto",dao.list(rowStart,rowEnd,searchKeyword,"2"));
		}else if(bisbn.equals("bisbn")&& btitle.equals("btitle")) {
			model.addAttribute("dto",dao.list(rowStart,rowEnd,searchKeyword,"3"));
		}else if(bisbn.equals("")&& btitle.equals("")) {
			model.addAttribute("dto",dao.list(rowStart,rowEnd,searchKeyword,"4"));
		}
		
		
	
				
//		model.addAttribute("dto", dto);
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("searchType", searchType);
		//=====230908 리연 추가
		String currentPage = "/admin/product"; 
	    System.out.println(currentPage);
		// 모델에 전달하기
	    model.addAttribute("currentPage",currentPage);
	}// override method

}// class