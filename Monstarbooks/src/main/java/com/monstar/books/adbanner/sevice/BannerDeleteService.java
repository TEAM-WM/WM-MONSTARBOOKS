package com.monstar.books.adbanner.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adbanner.dao.BannerDao;

@Service
public class BannerDeleteService implements BannerService{

	@Autowired
	private SqlSession session;

	// 생성자
	public BannerDeleteService(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
	    System.out.println(">>>문의 삭제 신호");

	    Map<String, Object> map = model.asMap();
	    HttpServletRequest request = (HttpServletRequest) map.get("request");
	    int bannerno = Integer.parseInt(request.getParameter("bannerno"));
	    BannerDao dao = session.getMapper(BannerDao.class);

	    // DELETED 값을 'yes'로 업데이트합니다.
	    dao.bannerdelete(bannerno);

	   
	}
}
