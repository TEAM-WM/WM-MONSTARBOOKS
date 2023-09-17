package com.monstar.books.booklist.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.booklist.dao.BookListDao;
import com.monstar.books.booklist.dto.BookListDto;
import com.monstar.books.booklist.vopage.SearchVO;

@Service
public class SearchBookListServiceList implements BookListService {

	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public SearchBookListServiceList(SqlSession session) {
		this.sqlSession = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>도서 검색 신호");
		
		BookListDao dao = sqlSession.getMapper(BookListDao.class);
		
		//map 변환, request 추출	
		Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        SearchVO searchVO = (SearchVO) map.get("searchVO");
        
     // 세션에서 회원 ID 가져오기
        HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("id");
        
//      search 값 가져오기
        String search = request.getParameter("search");
        System.out.println("search : "+search);
        
        if(search == null) { //처음 null처리
        	search = "";
        }
        model.addAttribute("search",search);
        
//      paging
        String strPage = request.getParameter("page");
        if(strPage == null) 
        	strPage="1";
        
        System.out.println("strPage : " + strPage);
        
        int page = Integer.parseInt(strPage);
        searchVO.setPage(page);
        
//      검색에 따른 총갯수 
        int total = dao.searchTotCnt(search);
        searchVO.pageCalculate(total);
        
//      paging 글번호 전달
        int rowStart = searchVO.getRowStart();
        int rowEnd = searchVO.getRowEnd();
        
        ArrayList<BookListDto> dto = dao.searchList(rowStart,rowEnd,search);	
        
        model.addAttribute("dto", dto);
		model.addAttribute("totRowCnt",total);
		model.addAttribute("searchVO",searchVO);
		model.addAttribute("pageName","search");
        
//		로그인상태인지 확인
		if(memberId != null) {
        	int memberno = dao.getMemberno(memberId);		
            model.addAttribute("memberno",memberno);					
		}else {
			model.addAttribute("memberno",0);
		}
	}// override method

}// class