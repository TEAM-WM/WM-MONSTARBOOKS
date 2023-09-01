package com.monstar.books.product.sevice;

import java.util.ArrayList;

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
public class ProductInsertReadyService implements ProductService {

	@Autowired
	private SqlSession session;

	// 생성자
	public ProductInsertReadyService(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>> INSERT READY SERVICE>>>");
		
		ProductDao dao = session.getMapper(ProductDao.class);
		
//		selectCategory에서 카테고리를 불러와둠
		ArrayList<BookCategoryDto> dto = dao.selectCategory();
		model.addAttribute("dto", dto);
		
//		System.out.println(dto);

	}// override method

}// class