package com.monstar.books.member.service;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.member.dao.MemberDao;
import com.monstar.books.member.dto.MemberDto;

@Service
public class MemberLoginProcessService implements MemberService {

	@Autowired
	private SqlSession sqlSession;
	
	public MemberLoginProcessService() {}
	
	public MemberLoginProcessService(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		// 맵 변환
		Map<String, Object> map = model.asMap();
		// 맵에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		HttpSession httpSession = (HttpSession) map.get("httpSession");
		// 로그인 상태유지 체크박스 값을 가져온다.
		String remember = request.getParameter("remember");
		String mid = request.getParameter("id");
		System.out.println("입력한 아이디 값 : "+mid);
		
		// dao 에서 아이디와 비밀번호에 유효한 정보를 얻어온다.
		MemberDto dto = dao.getData(mid);
		
		boolean isValid = false;
		if (dto != null) {// 아이디는 일치하는 경우(아이디만 일치할수 있다.)
			String encodedPwd = dto.getMpw();
			String inputPwd = request.getParameter("pw");
			BCryptPasswordEncoder machers = new BCryptPasswordEncoder();
			// DB 비밀번호와 input 비밀번호 비교
			isValid = machers.matches(inputPwd, encodedPwd);
			System.out.println("inputPwd : "+inputPwd);
			System.out.println("암호화 : "+encodedPwd);
			System.out.println(isValid);
		}
		if (isValid) {// 만일 유효한 정보이면(있다면)
			httpSession.setAttribute("id", dto.getMid());
			httpSession.setAttribute("auth", dto.getMauthority());
			httpSession.setAttribute("memberNumber", dto.getMemberno());
			model.addAttribute("isSuccess", true);
			// 로그인 상태 유지
			if (remember == null) {// 체크 안했다면
				// 저장된 쿠키 삭제
				Cookie idCook = new Cookie("savedId", dto.getMid());
				idCook.setMaxAge(0);// 삭제하기 위해 0 으로 설정
				response.addCookie(idCook);
			} else {
				// 아이디를 쿠키에 저장
				Cookie idCook = new Cookie("savedId", dto.getMid());
				idCook.setMaxAge(60 * 60);
				response.addCookie(idCook);
			}
		} else {
			model.addAttribute("isSuccess", false);
		}//if

	}// method

}// class