package com.monstar.books.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyReviewDao;
import com.monstar.books.mypage.dto.MyReviewDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import lombok.extern.slf4j.Slf4j;

@Service
@Primary
@Slf4j
public class MyReviewUpdateService implements MyPageService {

	@Autowired
	private SqlSession sqlSession;

	public MyReviewUpdateService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		log.info(">>> MyReviewUpdateService");
		// 맵 변환 및 request 추출
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

//	     로그인 사용자 ID 세션에서 받아오기
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("id");
		Integer no = (Integer) session.getAttribute("memberNumber");
		
		System.out.println("id받아줘 :" + mid);
		System.out.println("memberno받아줘 :" + no);
		
		MyReviewDao dao = sqlSession.getMapper(MyReviewDao.class);
		
		// 파일 업로드를 위한 경로 설정
		String path = "C:\\javabigsetspring2023\\spring_work\\.metadata\\.plugins\\org.eclipse.wst.server.core"
				+ "\\tmp1\\wtpwebapps\\Monstarbooks\\resources\\assets\\upload";
		log.info("path: {}", path);

		// TODO : 파일 업로드 구현
        MultipartRequest req = null;

		try {
			// MultipartRequest를 사용하여 파일 업로드 처리
			req = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8", new DefaultFileRenamePolicy());
			// 같은 파일명 존재 시, 1, 2, 3 붙여줌

			System.out.println("리뷰넘버 파라미터 "+request.getParameter("reviewno"));
			// 요청 파라미터로부터 데이터 추출
			String refilesrc = req.getFilesystemName("refilesrc"); // TODO : 파일 업로드
			int rstar = Integer.parseInt(req.getParameter("rstar"));
//			String rstar = request.getParameter("rstar");
			String rcontent = req.getParameter("rcontent");
			int reviewno = Integer.parseInt(req.getParameter("reviewno"));
//			String reviewno = request.getParameter("reviewno");
			
			
			System.out.println("값 받아줘: " + rstar + rcontent + reviewno + refilesrc);

			if(refilesrc==null) {
				refilesrc="";
			}	
			
			MyReviewDto viewDto = dao.myReviewView(reviewno, mid);
			System.out.println("reviewno받아줘 :" + reviewno + mid);

			// 잘못된 reviewNo
//			if (viewDto == null) {
//				log.error("잘못된 reviewNo");
//				// TODO : 예외 처리
//			}
			// 본인의 리뷰만 수정할 수 있어야 한다.
//            if (viewDto.getMemberno() != member.getMemberno()) {
//                log.error("잘못된 접근");
//                // TODO : 예외 처리
//            }

			dao.reviewUpdate(rstar, rcontent, reviewno, refilesrc, no);
////		dao.reviewUpdate(rstar, rcontent, reviewno, refilesrc, mid);
//
			} catch (Exception e) {
				e.printStackTrace();
				return; // 예외 처리를 제대로 수행하고, 처리를 중단합니다.
			}

	}
}