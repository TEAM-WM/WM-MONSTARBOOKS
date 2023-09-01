package com.monstar.books.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyProfileDao;
import com.oreilly.servlet.MultipartRequest;
@Service
public class MyProfileDeleteService implements MyPageService {
	private SqlSession sqlSession;
	
	public MyProfileDeleteService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>MyProfileDeleteService");

//		map변환
		Map<String, Object> map=model.asMap();
//		map에서 request추출
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		
		MyProfileDao dao=sqlSession.getMapper(MyProfileDao.class);
		
		try {
			int memberno = Integer.parseInt(request.getParameter("memberno"));
			String mprofileimg = ((MultipartRequest) request).getFilesystemName("mprofileimg");
			dao.delete(memberno, mprofileimg);
			
	          if (mprofileimg == null) {
	              mprofileimg = "";
	          }
			
		} catch (NumberFormatException e) {
			// TODO: handle exception
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}// execute method
		
}// class 종료

