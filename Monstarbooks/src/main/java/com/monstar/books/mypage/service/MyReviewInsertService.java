package com.monstar.books.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.member.dto.MemberDto;
import com.monstar.books.mypage.dao.MyReviewDao;
import com.monstar.books.mypage.dto.MyReviewDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import lombok.extern.slf4j.Slf4j;

// 230906 [효슬] 마이페이지 리뷰 글쓰기 서비스 추가
@Service
@Slf4j
public class MyReviewInsertService implements MyPageService {
	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public MyReviewInsertService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
//        log.info(">>>마이리뷰 글쓰기 신호");
		System.out.println(">>>마이리뷰 글쓰기 신호");

		// 맵 변환
		Map<String, Object> map = model.asMap();
		// 맵에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
//		MemberDto member = (MemberDto) request.getSession().getAttribute("user");
		System.out.println("서비스 리퀘스트" + request);

		MyReviewDao dao = sqlSession.getMapper(MyReviewDao.class);


		// 글쓰기 진행, toss 및 파일 업로드를 위한 경로 설정
		String path = "E:\\git\\WM-MONSTARBOOKS\\Monstarbooks\\src\\main\\webapp\\resources\\assets\\upload";
		log.info("path: {}", path);

		// TODO : 파일 업로드 구현
        MultipartRequest req = null;
        
        try {
            // MultipartRequest를 사용하여 파일 업로드 처리
            req = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8", new DefaultFileRenamePolicy());
            // 같은 파일명 존재 시, 1, 2, 3 붙여줌

    		System.out.println("bookno:"+req.getParameter("bookno"));
    		System.out.println("memberno:"+req.getParameter("memberno"));
            
            
		// 요청 파라미터로부터 데이터 추출
		String refilesrc = req.getFilesystemName("refilesrc"); // TODO : 파일 업로드 구현 후 추가
		String rtitle = req.getParameter("rtitle");
		String rcontent = req.getParameter("rcontent");
		String rstar = req.getParameter("rstar");
    		int bookno = Integer.parseInt(req.getParameter("bookno"));
    		int memberno = Integer.parseInt(req.getParameter("memberno"));
//    		int memberno = member.getMemberno();
		System.out.println("refilesrc 파라미터값 확인" + refilesrc + rtitle + rcontent + rstar);

		if (refilesrc == null) {
			refilesrc = "";
		}
    		
    	dao.reviewInsert(bookno, memberno, rtitle, rcontent, rstar, refilesrc);

		} catch (Exception e) {
			e.printStackTrace();
			return; // 예외 처리를 제대로 수행하고, 처리를 중단합니다.
		}

	} // execute method

}// class 종료
