package com.monstar.books.adreview.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adqna.dao.QnaDao;
import com.monstar.books.adreview.dao.ReviewDao;
import com.monstar.books.adreview.dto.ReviewDto;
import com.monstar.books.adreview.vopage.SearchVO;

@Service
public class ReviewServiceDelete implements ReviewService {
	
	@Autowired
	private SqlSession session;

	// 생성자
	public ReviewServiceDelete(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
	    System.out.println(">>>리뷰 삭제 신호");
	    Map<String, Object> map = model.asMap();
	    HttpServletRequest request = (HttpServletRequest) map.get("request");
	    System.out.println(">>> 리뷰 번호 : "+request.getParameter("reviewno"));
	    
	    ReviewDao dao = session.getMapper(ReviewDao.class);
	    int reviewno = Integer.parseInt(request.getParameter("reviewno"));

	    // DELETED 값을 'yes'로 업데이트합니다.
	    dao.reviewdelete(reviewno);
	}


}// class