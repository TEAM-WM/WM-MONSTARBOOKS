package com.monstar.books.booklist.sevice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.booklist.dao.BookListDao;

@Service
public class addCartServiceList implements BookListService {

	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public addCartServiceList(SqlSession session) {
		this.sqlSession = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>장바구니 추가 신호");
		
		BookListDao dao = sqlSession.getMapper(BookListDao.class);
		
		// 230829 진성 추가
		//map 변환, request 추출	
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// 세션에서 회원 ID 가져오기
        HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("id");
        System.out.println("id :"+memberId);
        if (memberId != null) {
        	int memberno = dao.getMemberno(memberId);		
            System.out.println("memberno :"+memberno);

    		String bookno = request.getParameter("bookno");
    		String cnt = request.getParameter("cnt");
    		
    		Integer booknoCheck = dao.booknoCheck(bookno,memberno);
    		System.out.println(booknoCheck);
    		if (booknoCheck == null) {
    			dao.cartInsert(memberno,bookno,cnt);//memberno 추후 수정			
    		}else {
    			dao.cartAddUpdate(memberno,bookno,cnt);//memberno 추후 수정
    		}
		}		
		
	}// override method

}// class