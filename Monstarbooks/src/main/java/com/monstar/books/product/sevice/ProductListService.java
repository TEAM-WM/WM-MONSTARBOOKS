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
import com.monstar.books.product.dto.BookDto;

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
		ArrayList<BookDto> dto = dao.list();
		model.addAttribute("dto", dto);
		System.out.println(dto);
		
//		System.out.println(dto);

	}// override method

}// class