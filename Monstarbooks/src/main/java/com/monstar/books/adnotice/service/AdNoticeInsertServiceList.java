package com.monstar.books.adnotice.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.monstar.books.adnotice.dao.AdNoticeDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdNoticeInsertServiceList implements AdNoticeService {
	private SqlSession sqlSession;
	
	public AdNoticeInsertServiceList(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {

		// Map 변환
		Map<String, Object> map = model.asMap();
		// Map에서 Request값 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// 사진을 받는 폴더의 위치
		String path = "C:\\MonstarBook-img";
		MultipartRequest req = null;
		try {
			req = new MultipartRequest(request, path, 1024*1024*20,
					"utf-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// request에서 받아오기
		String ntitle = req.getParameter("ntitle");
		String ncontent = req.getParameter("ncontent");
		// 파일을 request로 받아올때에는 getParameter가 아닌 getFilesystemName을 사용
		String nfilesrc = req.getFilesystemName("nfilesrc");
		
		System.out.println(nfilesrc);
		
		if(nfilesrc == null) {
			nfilesrc="x";
		}
		
		AdNoticeDao dao = sqlSession.getMapper(AdNoticeDao.class);
		
//		System.out.println(ntitle + "," + ncontent);
		
		dao.insert(ntitle,ncontent,nfilesrc);
		
	}

}
