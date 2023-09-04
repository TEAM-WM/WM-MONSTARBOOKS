package com.monstar.books.mypage.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.monstar.books.mypage.dao.MyReviewDao;
import com.monstar.books.mypage.service.MyPageService;
import com.monstar.books.mypage.service.MyReviewContentViewService;
import com.monstar.books.mypage.service.MyReviewDeleteService;
import com.monstar.books.mypage.service.MyReviewListService;
import com.monstar.books.mypage.service.MyReviewUpdateService;
import com.monstar.books.mypage.vopage.SearchVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class MyReviewController {

	MyPageService service;

	@Autowired
	private SqlSession sqlSession;

	// 230824 [효슬] 마이페이지 리뷰 리스트, 쓰기, 수정, 삭제 페이지
	// 230825,26 [효슬] 리뷰 리스트 페이징 기능 추가(완)
	@RequestMapping("common/myreview/myreview_list")  //myreview/list
	public String reviewlist(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("myreview_list 리뷰 목록입니다.");

		model.addAttribute("request", request);
		model.addAttribute("searchVO", searchVO);

		service = new MyReviewListService(sqlSession);
		service.execute(model);

		return "common/myreview/myreview_list";

	}// 리뷰 list 종료

	// 230827 [효슬] 리뷰 글쓰기 폼(완)
	@RequestMapping("common/myreview/myreview_insert")
	public String myreview_insert() {
		System.out.println("myreview_insert 리뷰 글쓰기 화면입니다.");

		return "common/myreview/myreview_insert";

	}// 리뷰 글쓰기 insert_view 종료

	// 230828,29 [효슬] 리뷰 글쓰기 기능 (확인중)
	@RequestMapping(method = RequestMethod.POST, value = "/common/myreview/reviewinsert")
	public String reviewinsert(HttpServletRequest request, Model model) {
		System.out.println("=====review 글쓰기 기능 추가합니다====="); // HTTP요청, MODEL

//		model.addAttribute("request",request);
//		service = new MyReviewInsertService(sqlSession);
//		service.execute(model);
		
		// 글쓰기 진행, toss 및 파일 업로드를 위한 경로 설정
		String path = "E:\\git\\WM-MONSTARBOOKS\\Monstarbooks\\src\\main\\webapp\\resources\\assets\\upload";

		MultipartRequest req = null;

		try { // MultipartRequest를 사용하여 파일 업로드 처리
			req = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8", new DefaultFileRenamePolicy());
			// 같은 파일명 존재 시 1,2,3을 붙여줌

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		MyReviewDao dao = sqlSession.getMapper(MyReviewDao.class);

		String rtitle = req.getParameter("rtitle");
		String rcontent = req.getParameter("rcontent");
		String refilesrc = req.getFilesystemName("refilesrc");
		int rstar = Integer.parseInt(req.getParameter("rstar"));
		
		// m_book 테이블 컬럼, m_bookcategory 테이블 컬럼
//		String bcategory1 = req.getParameter("bcategory1");
//		String bcategory2 = req.getParameter("bcategory2");
//		int bookno = Integer.parseInt(req.getParameter("bookno"));
//		String btitle = req.getParameter("btitle");
		
		
		// book, bookcategory 테이블, 데이터 가져오기
//		bcdto.setBcategory1(bcategory1);
//		bcdto.setBcategory2(bcategory2);
//		bdto.setBookno(bookno);
//		bdto.setBtitle(btitle);
//		dao.bcategory(bcdto);
//		dao.book(bdto);
				
		System.out.println("rtitle : " + rtitle);
		System.out.println("rcontent : " + rcontent);
		System.out.println("rstar : " + rstar);
		
//		System.out.println("bcategory1 : " + bcategory1);
//		System.out.println("bcategory2 : " + bcategory2);
//		System.out.println("bookno : " + bookno);
//		System.out.println("btitle : " + btitle);		
//		model.addAttribute("bcdto"+bcdto);
//		model.addAttribute("bdto"+bdto);
				
		if (refilesrc == null) {
			refilesrc = "";
			System.out.println("refilesrc" + refilesrc);
		}

		dao.reviewinsert(rtitle, rcontent, refilesrc);
		
		return "redirect:myreview_list";

	}// 리뷰 write 종료

	// 230829,30 [효슬] 리뷰 상세글 뷰 페이지 (확인중)
	@RequestMapping("common/myreview/myreview_view")
	public String myreview_view(HttpServletRequest request, Model model) {
		System.out.println("=======myreview_view() 리뷰 상세글 화면입니다.=========");
		// 리뷰 상세글 조회 toss
		model.addAttribute("request", request);
		service = new MyReviewContentViewService(sqlSession);
		service.execute(model);

		return "common/myreview/myreview_view";

	}// 리뷰 content_view 종료

	// 230826 [효슬] 리뷰 수정 폼 (확인중)
	@RequestMapping("common/myreview/myreview_update")
	public String myreview_update(HttpServletRequest request, Model model) {
		System.out.println("======myreview_update() 리뷰 수정 화면입니다.========");
//		글수정form // toss
		model.addAttribute("request", request);

		service = new MyReviewContentViewService(sqlSession);
		service.execute(model);

		return "common/myreview/myreview_update";

	}// 리뷰 수정 updateform 종료

	// 230828 [효슬] 리뷰 상세글 수정 기능 (진행전)
	@RequestMapping(method = RequestMethod.POST, value = "/reviewupdate")
	public String reviewupdate(HttpServletRequest request, Model model) {
		System.out.println("========reviewupdate()=========");
		// 글수정update // Model에 HttpServletRequest 추가
		model.addAttribute("request", request);

		// BModifyService 인스턴스 생성 및 실행
		service = new MyReviewUpdateService(sqlSession);
		service.execute(model);

		// 수정 후 목록 페이지로 리다이렉트
		return "redirect:myreview_list";

	}// 리뷰 상세글 update 기능 종료

	// 230828 [효슬] 리뷰 삭제 기능 (진행전)
	@RequestMapping("/reviewdelete")
	public String reviewdelete(HttpServletRequest request, Model model) {
		System.out.println("======reviewdelete()======");
		// db에 데이터 삭제 toss
		model.addAttribute("request", request);
		service = new MyReviewDeleteService(sqlSession);
		service.execute(model);

		return "redirect:myreview_list";

	}// 리뷰 삭제 delete 종료

}// class 종료
