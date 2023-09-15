package com.monstar.books.mypage.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.mypage.dao.MyProfileDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Primary
@Service
public class MyProfileUpdateService implements MyPageService {
	@Autowired
	private SqlSession sqlSession;

	// 생성자
	public MyProfileUpdateService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//230828,31 [효슬] 마이페이지 프로필 수정 서비스 기능
	@Override
	public void execute(Model model) {
		System.out.println(">>>프로필수정 기능 신호");

		// Model을 Map으로 변환하여 데이터 추출
		Map<String, Object> map = model.asMap();
		// Map에서 HttpServletRequest 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");

//      로그인 사용자 ID 세션에서 받아오기
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("id");
		System.out.println("id받아줘 :" + mid);
		//로그인프로세스 서비스 참조
//		httpSession.setAttribute("id", dto.getMid());
		
		///Users/klyeon/git/WM-MONSTARBOOKS/Monstarbooks/src/main/webapp/resources/assets/imgs/product
		// 파일 업로드를 위한 경로 설정
		String path = "/Users/klyeon/git/WM-MONSTARBOOKS/Monstarbooks/src/main/webapp/resources/assets/upload";	
//		해당 톰캣의 server.xml을 수정? <Context path="/상대경로" docBase="/절대경로" />
		
		
		// MyProfileDao를 이용하여 데이터베이스 업데이트 수행
		MyProfileDao dao = sqlSession.getMapper(MyProfileDao.class);
		
		MultipartRequest req = null;

		try {
			// MultipartRequest를 사용하여 파일 업로드 처리
			req = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8", new DefaultFileRenamePolicy());
			// 같은 파일명 존재 시,1,2,3을 붙여줌.

			// 요청 파라미터로부터 데이터 추출
//			String mid = req.getParameter("mid");
			String mprofileimg = req.getFilesystemName("mprofileimg");

			if (mprofileimg == null) {
				mprofileimg = "";
			}

			System.out.println("mid:" + mid);
			System.out.println("mprofileimg:" + mprofileimg);

			dao.profileupdate(mid, mprofileimg);
			session.setAttribute("profileImg", mprofileimg);
		} catch (Exception e) {
			e.printStackTrace();
		}

	} // execute method

}// class 종료
