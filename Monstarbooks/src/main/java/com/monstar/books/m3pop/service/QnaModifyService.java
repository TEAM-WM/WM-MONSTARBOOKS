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
		

		//String path="C:\\Users\\goott4\\git\\WM-MONSTARBOOKS\\Monstarbooks\\src\\main\\webapp\\resources\\assets\\upload";
		String attachPath = "resources\\assets\\upload\\";
	    // 실제 파일 경로를 구성합니다. 현재 세션의 서블릿 컨텍스트의 실제 경로와 파일 이름을 합쳐서 만듭니다.
		String path = request.getSession().getServletContext().getRealPath(attachPath);
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
