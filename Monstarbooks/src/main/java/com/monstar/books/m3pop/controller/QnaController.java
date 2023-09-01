package com.monstar.books.m3pop.controller;

import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.monstar.books.m3pop.service.BServiceInter;
import com.monstar.books.m3pop.service.QnaContentViewService;
import com.monstar.books.m3pop.service.QnaDeleteService;
import com.monstar.books.m3pop.service.QnaListService;
import com.monstar.books.m3pop.service.QnaModifyService;
import com.monstar.books.m3pop.service.QnaWriteService;
import com.monstar.books.m3pop.vopage.SearchVO;



@Controller
public class QnaController {
	
	BServiceInter bServiceInter;
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("/qna/list")
	public String list(HttpServletRequest request,SearchVO searchVO, Model model) { //model 파라미터는 리스트를 만들 때 가져온다??
		System.out.println("====list()====");
		
//		데이터 가져오기 작업
		//model.addAttribute("request", request);
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);
		bServiceInter = new QnaListService(sqlSession);
		bServiceInter.execute(model);
		

		
		return "common/qna/list";
	}
	
	@RequestMapping("/qna/write_view")
	public String write_view() {
		System.out.println("====write_view()====");
		
		return "common/qna/write_view";
	}
	
	@RequestMapping("/qna/write")
	public String write(HttpServletRequest request, Model model) throws Exception {
		System.out.println("====write()====");
		//글쓰기 진행
		//model에 담아서 toss
		model.addAttribute("request", request);
		bServiceInter = new QnaWriteService(sqlSession);
		bServiceInter.execute(model);
		
		//인터페이스 타입으로
//		String attachPath="resources\\upload\\";
//		String uploadPath=request.getSession().getServletContext().getRealPath("/");
		//System.out.println("uploadPath :"+uploadPath);
		
//		String path="C:\\javabjgsetspring2023\\spring_work"
//				+ "\\book3\\src\\main\\webapp\\resources\\upload";
//				//uploadPath+attachPath;
//		System.out.println("path :"+path);
//		MultipartRequest req=new MultipartRequest(request,
//				path, 1024*1024*20, "utf-8",new DefaultFileRenamePolicy()) ;
//			String qcategory = req.getParameter("qcategory"); //
//			String quserID = req.getParameter("quserID"); //
//			String qtitle = req.getParameter("qtitle"); //
//			String qcontent = req.getParameter("qcontent"); //
//			String fname=req.getFilesystemName("qfilesrc"); //
//			System.out.println("qcontent :"+qcategory+quserID+qtitle+qcontent);
//			System.out.println("fname :"+fname);
//			
//			if(fname==null) {
//				fname="";
//			}
//	
//			QnaDao dao = sqlSession.getMapper(QnaDao.class);
//			dao.write(qcategory,qtitle, qcontent,fname);
		
//		return "/list"; //리다이렉트와 다르다??
		return "redirect:/qna/list";
	}
	
	@RequestMapping("/qna/download")
	public String download(HttpServletRequest request,HttpServletResponse response,
			Model model ) throws Exception {
		System.out.println("=============다운로드()==============");
		
		String path=request.getParameter("p");
		String fname=request.getParameter("f");
		String qnano=request.getParameter("qnano");
		
		//다운처리
		response.setHeader("Content-Disposition",
				"Attachment;filename="+URLEncoder.encode(fname,"utf8"));
		String attachPath="resources\\assets\\upload\\";
		String realPath=request.getSession().getServletContext().getRealPath(attachPath)+
				"\\"+fname;
		System.out.println("realpath :"+realPath);
		
		//스트림연결
		FileInputStream fin=new FileInputStream(realPath);
		ServletOutputStream sout=response.getOutputStream();
		
		byte[] buf=new byte[1024];
		int size=0;
		
		while((size=fin.read(buf,0,1024))!=-1) {
			sout.write(buf,0,size);

		}
		
		fin.close();
		sout.close();
		
		return "common/qna/content_view?qnano="+qnano;
	}
	
	
	@RequestMapping("/qna/content_view")
	public String content_view(HttpServletRequest request, Model model) {
		System.out.println("====content_view()====");
				
		//글조회 진행
		//model에 담아서 toss. 이 모델이 BContentViewService로 전달.
		model.addAttribute("request", request);
		bServiceInter = new QnaContentViewService(sqlSession);
		bServiceInter.execute(model);
				
		
		return "common/qna/content_view";
	}
	
	@RequestMapping("/qna/content_update")
	public String content_update(HttpServletRequest request, Model model) {
		System.out.println("====content_update()====");
				
		//글수정 form
		//model에 담아서 toss. 이 모델이 BContentViewService로 전달.
		model.addAttribute("request", request);
		bServiceInter = new QnaContentViewService(sqlSession);
		bServiceInter.execute(model);

	
		return "common/qna/content_update";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/qna/modify")
	public String modify(HttpServletRequest request, Model model) throws Exception {
		System.out.println("====modify()====");
				
		//글수정 update
		//model에 담아서 toss. 이 모델이 BContentViewService로 전달.
		model.addAttribute("request", request);
		bServiceInter = new QnaModifyService(sqlSession);
		bServiceInter.execute(model);
	
		return "redirect:/qna/list";
	}
	
	@RequestMapping("/qna/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("====delete()====");
				
		//글삭제
		//model에 담아서 toss. 이 모델이 BDeleteService로 전달.
		model.addAttribute("request", request);
		bServiceInter = new QnaDeleteService(sqlSession);
		bServiceInter.execute(model);

				
		return "redirect:/qna/list";
	}
	

	

}
