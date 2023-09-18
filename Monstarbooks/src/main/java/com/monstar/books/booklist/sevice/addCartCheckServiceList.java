package com.monstar.books.booklist.sevice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.booklist.dao.BookListDao;

@Service
public class addCartCheckServiceList implements BookListService {

	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public addCartCheckServiceList(SqlSession session) {
		this.sqlSession = session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println(">>>장바구니 추가 신호");
		
		//map 변환, request 추출	
		Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");
        
		BookListDao dao = sqlSession.getMapper(BookListDao.class);
		
		// 세션에서 회원 ID 가져오기
        HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("id");
        System.out.println("id :"+memberId);
        
        if(memberId != null) {
        	int memberno = dao.getMemberno(memberId);		
            System.out.println("memberno :"+memberno);
            
      
    		List<String> chArr = (List<String>) map.get("chArr");
    		
    		for (String i : chArr) {//체크된 도서의 bookno 하나씩 검사
    			// 이미 장바구니에 담겼는가?
    			Integer booknoCheck = dao.booknoCheck(i,memberno);
    			if (booknoCheck == null) {// 장바구니에 없을 때
    				dao.cartInsert(memberno,i,"1");				
    			}else { // 장바구니에 담겨있을 때
    				dao.cartAddUpdate(memberno,i,"1");
    			}
    		}
        }
		
	}// override method

}// class