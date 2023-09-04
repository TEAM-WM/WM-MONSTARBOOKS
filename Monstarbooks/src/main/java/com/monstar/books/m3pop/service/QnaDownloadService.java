package com.monstar.books.m3pop.service;

import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


@Service
public class QnaDownloadService implements BServiceInter {

	private SqlSession sqlSession;
	
	public QnaDownloadService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model)  {
		System.out.println(">>> BContentViewService >>>");
		
		
		
//		map변환
		Map<String, Object> map = model.asMap();
		
//		map에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		System.out.println("=============다운로드()==============");
		
		String path=request.getParameter("p");
		String fname=request.getParameter("f");
		String bid=request.getParameter("bid");
		try {
		//다운처리
		response.setHeader("Content-Disposition",
				"Attachment;filename="+URLEncoder.encode(fname,"utf8"));
		String attachPath="resources\\upload\\";
		String realPath=request.getSession().getServletContext().getRealPath(attachPath)+
				"\\"+fname;
		System.out.println("realpath :"+realPath);
		
		//스트림연결
		FileInputStream fin;
	
		fin = new FileInputStream(realPath);
		ServletOutputStream sout=response.getOutputStream();
		
		byte[] buf=new byte[1024];
		int size=0;
		
		while((size=fin.read(buf,0,1024))!=-1) {
			sout.write(buf,0,size);

		}
		
		fin.close();
		sout.close();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
		
		
		

		
	}


}
