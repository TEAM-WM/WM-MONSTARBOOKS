package com.monstar.books.m3pop.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.m3pop.dao.QnaDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class QnaModifyService implements BServiceInter{

	private SqlSession sqlSession;	
	
	public QnaModifyService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		System.out.println(">>>BModifyService");
		//모델에서 request를 풀기
//		맵으로변환
		Map<String, Object> map=model.asMap();
//		맵에서 request를 풀기
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		

		
		String path="C:\\javabjgsetspring2023\\spring_work"
				+ "\\book3\\src\\main\\webapp\\resources\\upload";
		//인터페이스 타입으로
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		MultipartRequest req;
		try {
			req = new MultipartRequest(request,
					path, 1024*1024*20, "utf-8",new DefaultFileRenamePolicy());
		
			String qnano = req.getParameter("qnano"); //
			System.out.println("qnano"+qnano);
			String qcategory = req.getParameter("qcategory"); //
			//String quserID = req.getParameter("quserID"); //
			String qtitle = req.getParameter("qtitle"); //
			String qcontent = req.getParameter("qcontent"); //
			String oldqfilesrc = req.getParameter("oldqfilesrc"); //
			String fname=req.getFilesystemName("qfilesrc"); //
			if(fname==null) {
				fname=oldqfilesrc;
			}
			
			//quserID,
			//QNANO QCATEGORY QTITLE QCONTENT QFILESRC
			dao.modify(qnano, qcategory, qtitle,qcontent,fname);
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		
	}

}
