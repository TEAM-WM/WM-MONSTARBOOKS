package com.monstar.books.m3pop.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.m3pop.dao.QnaDao;
import com.monstar.books.m3pop.dto.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class QnaWriteService implements BServiceInter {

	private SqlSession sqlSession;
	
	public QnaWriteService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>> BWriteService >>>");
		//모델에서 request를 풀어서 맵으로 전환(BController의 toss아래)
		Map<String, Object> map = model.asMap();
		HttpServletRequest request= (HttpServletRequest) map.get("request");

		 String attachPath = "resources/assets/upload/";
		    // 실제 파일 경로를 구성합니다. 현재 세션의 서블릿 컨텍스트의 실제 경로와 파일 이름을 합쳐서 만듭니다.
		 String path = request.getSession().getServletContext().getRealPath(attachPath);
		//String path="C:\\Users\\goott4\\git\\WM-MONSTARBOOKS\\Monstarbooks\\src\\main\\webapp\\resources\\assets\\upload";
				//uploadPath+attachPath;
		System.out.println("path :"+path);
		MultipartRequest req;
		try {
			req = new MultipartRequest(request,
					path, 1024*1024*20, "utf-8",new DefaultFileRenamePolicy());
		
			String qcategory = req.getParameter("qcategory"); //
			int memberno = Integer.parseInt(req.getParameter("memberno")) ; //
			String qtitle = req.getParameter("qtitle"); //
			String qcontent = req.getParameter("qcontent"); //
			String fname=req.getFilesystemName("qfilesrc"); //
			//System.out.println("qcontent :"+qcategory+qtitle+qcontent);
			//System.out.println("fname :"+fname);
			
			if(fname==null) {
				fname="";
			}

			
			QnaDao dao = sqlSession.getMapper(QnaDao.class);
			dao.write(qcategory,qtitle, qcontent,fname,memberno);
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int iResult	=1;
		model.addAttribute("iResult", iResult);
//		return "/list"; //리다이렉트와 다르다??
		
		
	}

}
