package com.monstar.books.product.sevice;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.ex.dao.ExDao;
import com.monstar.books.ex.dto.ExDto;
import com.monstar.books.product.dao.ProductDao;
import com.monstar.books.product.dto.BookCategoryDto;
import com.monstar.books.product.dto.BookDto;

@Service
public class ProductInsertService implements ProductService {

	//private lkasjdfDto;
	
	@Autowired
	private SqlSession session;
	
	// 생성자
	public ProductInsertService(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>> INSERT SERVICE VIEW >>>");
		
		ProductDao dao = session.getMapper(ProductDao.class);
		
		//map변환
		Map<String, Object> map = model.asMap();
		
		//map에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		
		
		int bisbn = Integer.parseInt(request.getParameter("bisbn"));
		String btitle = request.getParameter("btitle");
		String bsubtitle = request.getParameter("bsubtitle");
		String bpublisher = request.getParameter("bpublisher");
		String bwriter = request.getParameter("bwriter");
		String btranslator = request.getParameter("btranslator");
		String bpdate = request.getParameter("bpdate");
		int bprice = Integer.parseInt(request.getParameter("bprice"));
		int bpricesell = Integer.parseInt(request.getParameter("bpricesell"));
		int bdiscount = Integer.parseInt(request.getParameter("bdiscount"));
		String bstatus = request.getParameter("bstatus");
//		String bcdate = request.getParameter("bcdate");
//		String bmdate = request.getParameter("bmdate");
		int bstock = Integer.parseInt(request.getParameter("bstock"));
				
		
//		//selectCategory에서 카테고리를 불러옴
//		ArrayList<BookCategoryDto> dto = dao.selectCategory();
//		model.addAttribute("dto", dto);
				
		//테이블 "도서"에 정보 입력
		dao.insertBook(bisbn, btitle, bsubtitle, bpublisher, bwriter, btranslator,
				bpdate, bprice, bpricesell, bdiscount, bstatus, bstock);	
		
		
		
//		String bcategory1 = request.getParameter("bcategory1");
//		String bcategory2 = request.getParameter("bcategory2");
//				
//		ArrayList<BookCategoryDto> dto = dao.insertBookCategory(bcategory1, bcategory2);

		
		
	}// override method

}// class