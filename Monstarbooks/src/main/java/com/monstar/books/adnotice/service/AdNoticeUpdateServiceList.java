package com.monstar.books.adnotice.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.monstar.books.adnotice.dao.AdNoticeDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdNoticeUpdateServiceList implements AdNoticeService {
	private SqlSession sqlSession;
	
	public AdNoticeUpdateServiceList(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		// Map 변환
		Map<String, Object> map = model.asMap();
		// Map에서 Request값 추출하기
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MultipartRequest req=(MultipartRequest) map.get("req");
//		String path = "C:\\MonstarBook\\WM-MONSTARBOOKS\\Monstarbooks\\src\\main\\webapp\\resources\\assets\\upload";
//		MultipartRequest req = null;
//		
//		try {
//			req = new MultipartRequest(request, path, 1024*1024*20,
//					"utf-8", new DefaultFileRenamePolicy());
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		
		String noticeno = req.getParameter("noticeno");
		String ntitle = req.getParameter("ntitle");
		String ncontent = req.getParameter("ncontent");
		String nfilesrc = req.getFilesystemName("nfilesrc");
		
		System.out.println("noticeno:" + noticeno);
//		System.out.println("nfilesrc : " + nfilesrc);		// 넘어옴
		
		if(nfilesrc == null) {
			nfilesrc = "x";
		}
		
		AdNoticeDao dao = sqlSession.getMapper(AdNoticeDao.class);
		dao.update(noticeno,ntitle,ncontent,nfilesrc);
		
		
		
	}

}
