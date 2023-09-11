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
		
		System.out.println(">>> INSERT SERVICE >>>");
		
		ProductDao dao = session.getMapper(ProductDao.class);
				
		//map변환
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		//파일업로드(도서썸네일, 디테일)
		String path = "C:\\Users\\joon879\\git\\WM-MONSTARBOOKS\\Monstarbooks\\src\\main\\webapp\\resources\\assets\\imgs\\product";

		MultipartRequest req = null;
		try {
			req = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8", new MyFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		//"도서"테이블에 넣을 정보
//		int bookno = Integer.parseInt(request.getParameter("bookno"));
		long bisbn = Long.parseLong(req.getParameter("bisbn"));

//		int bisbn = Integer.parseInt(req.getParameter("bisbn"));
		String btitle = req.getParameter("btitle");
		String bsubtitle = req.getParameter("bsubtitle");
		String bpublisher = req.getParameter("bpublisher");
		String bwriter = req.getParameter("bwriter");
		String btranslator = req.getParameter("btranslator");
		String bpdate = req.getParameter("bpdate");
		int bprice = Integer.parseInt(req.getParameter("bprice"));
		int bpricesell = Integer.parseInt(req.getParameter("bpricesell"));
		int bdiscount = Integer.parseInt(req.getParameter("bdiscount"));
		String bstatus = req.getParameter("bstatus");
//		String bcdate = request.getParameter("bcdate");
//		String bmdate = request.getParameter("bmdate");
		int bstock = Integer.parseInt(req.getParameter("bstock"));
				
		
//		//selectCategory에서 카테고리를 불러옴
//		ArrayList<BookCategoryDto> dto = dao.selectCategory();
//		model.addAttribute("dto", dto);
				
		//"도서" 테이블에 정보 입력
		dao.insertBook(bisbn, btitle, bsubtitle, bpublisher, bwriter, btranslator,
				bpdate, bprice, bpricesell, bdiscount, bstatus, bstock);	
						
		
		
		
				
		
		//"디테일" 테이블에 넣을 정보
//		int bookno = request.getParameter("bookno");
		int bcategoryno = Integer.parseInt(req.getParameter("bcategoryno"));//라디오버튼
		String bimg = req.getFilesystemName("bimg");
		String bimgdetail = req.getFilesystemName("bimgdetail");
		String bdescription = req.getParameter("bdescription");
		int bpage = Integer.parseInt(req.getParameter("bpage"));
		String bsize = req.getParameter("bsize");
		String badge = req.getParameter("badge");
		
		if (bimg == null) {
			bimg = "";
		}
		if (bimgdetail == null) {
			bimgdetail = "";
		}
		
		System.out.println("bcategoryno: "+bcategoryno);
		
//		디테일 테이블에 도서 테이블과 같은 bookno를 넣는 법
//		1. 디테일 테이블에서도 시퀀스를 만들고 nextval로 쿼리 날림
//		2. 도서 테이블의 도서이름+ISBN 등 2가지 데이터를 합쳐서 날리고 
//			그 칼럼의 bookno를 가져오기
//		-> 일단 1번으로 고고
				
		//"디테일" 테이블에 정보 입력
		dao.insertBookDetail(bcategoryno, bimg, bimgdetail, bdescription,
				bpage, bsize, badge);
		
		


		
		
	}// override method

}// class