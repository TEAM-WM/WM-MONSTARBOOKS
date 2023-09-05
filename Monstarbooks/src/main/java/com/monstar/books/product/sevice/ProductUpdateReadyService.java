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
import com.monstar.books.product.dto.BookCategoryDto;
import com.monstar.books.product.dto.BookDto;

@Service
public class ProductUpdateReadyService implements ProductService {

	@Autowired
	private SqlSession session;

	// 생성자
	public ProductUpdateReadyService(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>> UPDATE READY SERVICE>>>");
		
		ProductDao dao = session.getMapper(ProductDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
//		selectCategory()에서 카테고리를 불러와둠
		ArrayList<BookCategoryDto> dto = dao.selectCategory();
		model.addAttribute("dto", dto);
		
		int selectedValue = Integer.parseInt(request.getParameter("bcategoryno"));
		model.addAttribute("selectedValue", selectedValue);

//		detail()에서 상품 정보를 불러와둠
		int bookno = Integer.parseInt(request.getParameter("bookno"));
		BookDto dtos = dao.detail(bookno);
		model.addAttribute("dtos", dtos);
		
	


	}// override method

}// class