package com.monstar.books.product.sevice;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.monstar.books.ex.dao.ExDao;
import com.monstar.books.ex.dto.ExDto;
import com.monstar.books.product.dao.ProductDao;
import com.monstar.books.product.dto.BookCategoryDto;
import com.monstar.books.product.dto.BookDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class ProductDeleteService implements ProductService {
	
	@Autowired
	private SqlSession session;
	
	// 생성자
	public ProductDeleteService(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>> DELETE SERVICE >>>");
		
		ProductDao dao = session.getMapper(ProductDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int bookno = Integer.parseInt(request.getParameter("bookno"));
		
		dao.deleteBookDetail(bookno); //디테일에서 키를 참조 중이라 먼저 삭제.
		dao.deleteBook(bookno);	
				
		
		
		
		
	}// override method

}// class