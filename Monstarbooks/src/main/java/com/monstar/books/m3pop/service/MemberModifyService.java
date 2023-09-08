package com.monstar.books.m3pop.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.m3pop.dao.MemberDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class MemberModifyService implements BServiceInter{

	private SqlSession sqlSession;	
	
	public MemberModifyService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		System.out.println(">>>MemberModifyService");
		//모델에서 request를 풀기
//		맵으로변환
		Map<String, Object> map=model.asMap();
//		맵에서 request를 풀기
		HttpServletRequest request=
				(HttpServletRequest) map.get("request");
		

		
		//String path="C:\\javabjgsetspring2023\\spring_work"
		//		+ "\\book3\\src\\main\\webapp\\resources\\upload";
		//인터페이스 타입으로
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		//MultipartRequest req;
		try {
		 //req=new MultipartRequest(request,
		//		path, 1024*1024*20, "utf-8",new DefaultFileRenamePolicy()) ;
			String mid = request.getParameter("mid"); //
			String mbirth = request.getParameter("mbirth"); //
			//String mname = req.getParameter("mname"); //
			String memail = request.getParameter("memail"); //
			String mtel2 = request.getParameter("mtel2"); //
			String mtel3 = request.getParameter("mtel3"); //
			String mtel4 = request.getParameter("mtel4"); //
			
			String mtel = mtel2+mtel3+mtel4; //
			//String mprofileimg = req.getFilesystemName("mprofileimg"); //

			String[] mfavorite = request.getParameterValues("mfavorite");
			int ml=mfavorite.length-1;
			String mf="";
			for (int i = 0; i < mfavorite.length; i++) {

				
			if(i==ml){
				mf +=mfavorite[i]+"";	
			}else{
				mf +=mfavorite[i]+",";	
			}
			}
			//if(mprofileimg==null) {
			//	mprofileimg="";
			//}
			System.out.println(mid+ mbirth+memail+mtel+"p:"+"m"+mf);
		//quserID,
		dao.modify(mid, mbirth,memail,mtel,mf);
		int result=1;
		//model.addAttribute("mid",mid);
		model.addAttribute("result", result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
	}

}
