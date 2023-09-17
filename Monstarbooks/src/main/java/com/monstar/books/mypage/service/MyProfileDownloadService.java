package com.monstar.books.mypage.service;

import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class MyProfileDownloadService implements MyPageService {
	@Autowired
	private SqlSession sqlSession;

	public MyProfileDownloadService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 230831 [효슬] 마이페이지 프로필이미지 다운로드, 저장공간 서비스 기능
	@Override
	public void execute(Model model) {
		System.out.println(">>>MyProfileDownloadService");

		// map변환 request, response 추출
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

//		로그인 사용자 ID 세션에서 받아오기
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("id");
		System.out.println("id받아줘 :" + mid);
		// 로그인프로세스 서비스 참조
//		httpSession.setAttribute("id", dto.getMid());

		String path = request.getParameter("p");
		String mprofileimg = request.getParameter("f");
//		String mid = request.getParameter("mid");

		try {// 파일 다운로드를 처리하기 위한 코드 블록 시작
				// 다운로드할 파일의 이름을 URL 인코딩하여 설정하고, 응답 헤더에 추가합니다.
			response.setHeader("Content-Disposition", "Attachment;filename=" + URLEncoder.encode(mprofileimg, "utf-8"));

			// 첨부 파일의 경로를 설정합니다.
			String attachPath = "resources\\assets\\upload\\";
			// 실제 파일 경로를 구성합니다. 현재 세션의 서블릿 컨텍스트의 실제 경로와 파일 이름을 합쳐서 만듭니다.
			String realPath = request.getSession().getServletContext().getRealPath(attachPath) + "\\" + mprofileimg;
			System.out.println("realpath: " + realPath);

			// 파일을 읽기 위해 FileInputStream을 생성합니다.
			FileInputStream fin = new FileInputStream(realPath);
			// 응답으로부터 출력 스트림을 가져옵니다.
			ServletOutputStream sout = response.getOutputStream();

			// 파일 데이터를 읽어서 출력 스트림으로 전송합니다.
			byte[] buf = new byte[1024]; // 1024 바이트 크기의 버퍼를 생성합니다.
			int size = 0;
			while ((size = fin.read(buf, 0, 1024)) != -1) {
				sout.write(buf, 0, size); // 버퍼에서 실제로 읽은 크기만큼 데이터를 출력 스트림으로 전송합니다.
			}

			fin.close();
			sout.close();
			// 파일 다운로드를 처리하기 위한 코드 블록 종료
			} catch (Exception e) {
		}
	}// execute method
}// class
