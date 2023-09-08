package com.monstar.books.product.sevice;

import java.util.ArrayList;
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
		
		//paging 시작
		String strPage = request.getParameter("page");
		
		//처음 list null처리
		if(strPage==null) {
			strPage = "1";
		}
		System.out.println("pagggggg:"+strPage);
		int page = Integer.parseInt(strPage);
		searchVO.setPage(page); //페이지 전달
		
		int total = dao.selectBoardTotCount();
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
		ArrayList<BookDto> dto = dao.list(rowStart, rowEnd);
				
		model.addAttribute("dto", dto);
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVO", searchVO);
		
		//=====230908 리연 추가
		String currentPage = "/admin/product"; 
	    System.out.println(currentPage);
		// 모델에 전달하기
	    model.addAttribute("currentPage",currentPage);
	}// override method

}// class