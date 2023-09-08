package com.monstar.books.mypage.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.monstar.books.member.dto.MemberDto;
import com.monstar.books.mypage.service.MyPageService;
import com.monstar.books.mypage.service.MyReviewContentViewService;
import com.monstar.books.mypage.service.MyReviewDeleteService;
import com.monstar.books.mypage.service.MyReviewInsertService;
import com.monstar.books.mypage.service.MyReviewInsertViewService;
import com.monstar.books.mypage.service.MyReviewListService;
import com.monstar.books.mypage.service.MyReviewUpdateService;
import com.monstar.books.mypage.vopage.SearchVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MyReviewController {

	private MyPageService myPageService;

	@Autowired
	private SqlSession sqlSession;

	// 230824 [효슬] 마이페이지 리뷰 리스트, 쓰기, 수정, 삭제 페이지
	// 230825,26 [효슬] 리뷰 리스트 페이징 기능 추가(완)
	@RequestMapping("/myreview/list")
	public String reviewList(HttpServletRequest request, SearchVO searchVO, Model model) {
		// 로그인 체크, (기존 로그인 로직에서는 MID가 세션에 담겨있는데, 리뷰 테이블은 MEMBERNO와 참조가 되어있음. MID를 가지고 다시
		// 회원 정보를 조회해 MEMBERNO를 얻는 것은 낭비이므로 로그인 쪽 로직에서 MemberDTO를 세션에 담도록 수정)
//		MemberDto member = (MemberDto) request.getSession().getAttribute("memberNumber");
//		MemberDto mid = (MemberDto) request.getSession().getAttribute("id");

//		if (member == null) {
//			return "redirect:/";
//		}

		System.out.println("myreview_list 리뷰 목록입니다.");
		model.addAttribute("request", request);
		model.addAttribute("searchVO", searchVO);
		
		myPageService = new MyReviewListService(sqlSession);
		myPageService.execute(model);

		return "common/myreview/myreview_list";

	}// 리뷰 list 종료

	// 230827,230904 [효슬] 리뷰 글쓰기 폼(완)
	@RequestMapping("/myreview/insertview")
	public String myreviewInsert(HttpServletRequest request, Model model) {
		// 로그인 체크, (기존 로그인 로직에서는 MID가 세션에 담겨있는데, 리뷰 테이블은 MEMBERNO와 참조가 되어있음. MID를 가지고 다시
		// 회원 정보를 조회해 MEMBERNO를 얻는 것은 낭비이므로 로그인 쪽 로직에서 MemberDTO를 세션에 담도록 수정)
//		MemberDto member = (MemberDto) request.getSession().getAttribute("user");
//		if(member == null) {
//			return "redirect:/";
//		}	
		// 리뷰 글쓰기 뷰 toss
		model.addAttribute("request", request);

	    log.info("=======myreview_insertview() 리뷰 글쓰기 화면입니다.=========");
		
		myPageService = new MyReviewInsertViewService(sqlSession);
		myPageService.execute(model);
		
		return "common/myreview/myreview_insertview";

	}// 리뷰 글쓰기 insert_view 종료

	// 230828,29,230905 [효슬] 리뷰 글쓰기 기능 (진행중----------)
	@RequestMapping(method = RequestMethod.POST, value = "/myreview/insert")
//	@PostMapping(value = "/myreview/insert")
	public String reviewInsert(HttpServletRequest request, Model model) {
		// 로그인 체크, (기존 로그인 로직에서는 MID가 세션에 담겨있는데, 리뷰 테이블은 MEMBERNO와 참조가 되어있음. MID를 가지고 다시
		// 회원 정보를 조회해 MEMBERNO를 얻는 것은 낭비이므로 로그인 쪽 로직에서 MemberDTO를 세션에 담도록 수정)
//		MemberDto member = (MemberDto) request.getSession().getAttribute("user");
//		if(member == null) {
//			return "redirect:/";
//		}
		
		log.info("=====review 글쓰기 기능 추가합니다====="); // HTTP요청, MODEL

		model.addAttribute("request", request);
		System.out.println("request받았나:"+request);
		
//		parseint전에 int 0 초기화 및 null값 들어오는지 확인

		
		myPageService = new MyReviewInsertService(sqlSession);
		myPageService.execute(model);

		// 작성 후 목록 페이지로 리다이렉트
//		String reviewno = request.getParameter("reviewno");
//		String memberno = request.getParameter("memberno");

//		return "redirect:/myreview/view?reviewno=" + reviewno;
		return "redirect:list";

	}// 리뷰 insert 기능 종료

	// 230829,30,230904 [효슬] 리뷰 상세글 뷰 페이지 (완료)
	@RequestMapping("/myreview/view")
	public String myReviewView(HttpServletRequest request, Model model) {
		// 로그인 체크, (기존 로그인 로직에서는 MID가 세션에 담겨있는데, 리뷰 테이블은 MEMBERNO와 참조가 되어있음. MID를 가지고 다시
		// 회원 정보를 조회해 MEMBERNO를 얻는 것은 낭비이므로 로그인 쪽 로직에서 MemberDTO를 세션에 담도록 수정)
//		MemberDto member = (MemberDto) request.getSession().getAttribute("user");
//		if(member == null) {
//			return "redirect:/";
//		}

		// reviewno 파라미터 있는지 체크.
		String reviewNo = request.getParameter("reviewno");
		if (reviewNo == null || reviewNo.isEmpty()) {
			// TODO : 예외 처리
		}

		log.info("=======myReviewView() 리뷰 상세글 화면입니다.=========");
		// 리뷰 상세글 조회 toss
		model.addAttribute("request", request);

		myPageService = new MyReviewContentViewService(sqlSession);
		myPageService.execute(model);

		return "common/myreview/myreview_view";

	}// 리뷰 content_view 종료

	// 230826 [효슬] 리뷰 수정 폼 (확인중)
	@RequestMapping("/myreview/update")
	public String myReviewUpdate(HttpServletRequest request, Model model) {
		// 로그인 체크, (기존 로그인 로직에서는 MID가 세션에 담겨있는데, 리뷰 테이블은 MEMBERNO와 참조가 되어있음. MID를 가지고 다시
		// 회원 정보를 조회해 MEMBERNO를 얻는 것은 낭비이므로 로그인 쪽 로직에서 MemberDTO를 세션에 담도록 수정)
//		MemberDto member = (MemberDto) request.getSession().getAttribute("user");
//		if(member == null) {
//			return "redirect:/";
//		}

		log.info("======myReviewUpdate() 리뷰 수정 화면입니다.========");
//		글수정form // toss
		model.addAttribute("request", request);

		myPageService = new MyReviewContentViewService(sqlSession);
		myPageService.execute(model);

		return "common/myreview/myreview_update";

	}// 리뷰 수정 updateform 종료

	// 230828 [효슬] 리뷰 상세글 수정 기능
	@PostMapping(value = "/myreview/reviewupdate")
	public String reviewUpdate(HttpServletRequest request, Model model) {
		// 로그인 체크, (기존 로그인 로직에서는 MID가 세션에 담겨있는데, 리뷰 테이블은 MEMBERNO와 참조가 되어있음. MID를 가지고 다시
		// 회원 정보를 조회해 MEMBERNO를 얻는 것은 낭비이므로 로그인 쪽 로직에서 MemberDTO를 세션에 담도록 수정)
//		MemberDto member = (MemberDto) request.getSession().getAttribute("user");
//		if(member == null) {
//			return "redirect:/";
//		}

		log.info("========reviewUpdate()=========");
		// 글수정update // Model에 HttpServletRequest 추가
		model.addAttribute("request", request);

		
		System.out.println("rstar:받아줘 "+request.getParameter("rstar"));
		System.out.println("rcontent:받아줘 "+request.getParameter("rcontent"));
		System.out.println("reviewno:받아줘 "+request.getParameter("reviewno"));
		System.out.println("refilesrc:받아줘 "+request.getParameter("refilesrc"));
		
		
		// BModifyService 인스턴스 생성 및 실행
		myPageService = new MyReviewUpdateService(sqlSession);
		myPageService.execute(model);

		// 수정 후 목록 페이지로 리다이렉트
//		String reviewNo = request.getParameter("reviewno");
//		return "redirect:/myreview/view?reviewno=" + reviewNo;
		return "redirect:list";

	}// 리뷰 상세글 update 기능 종료

	// 230828 [효슬] 리뷰 삭제 기능 (진행전)
	@RequestMapping("/myreview/reviewdelete")
	public String reviewDelete(HttpServletRequest request, Model model) {
		// 로그인 체크, (기존 로그인 로직에서는 MID가 세션에 담겨있는데, 리뷰 테이블은 MEMBERNO와 참조가 되어있음. MID를 가지고 다시
		// 회원 정보를 조회해 MEMBERNO를 얻는 것은 낭비이므로 로그인 쪽 로직에서 MemberDTO를 세션에 담도록 수정)
//		MemberDto member = (MemberDto) request.getSession().getAttribute("user");
//		if(member == null) {
//			return "redirect:/";
//		}

		// reviewno 파라미터 체크
//		String reviewno = request.getParameter("reviewno");
//		if (reviewno == null || reviewno.isEmpty()) {
//			// TODO : 예외 처리
//		}

		log.info("======reviewDelete()======");
		// db에 데이터 삭제 toss
		model.addAttribute("request", request);
		myPageService = new MyReviewDeleteService(sqlSession);
		myPageService.execute(model);

		return "redirect:list";
	}// 리뷰 삭제 delete 종료

}// class 종료
