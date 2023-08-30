package com.monstar.books.member.sevice;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.member.dao.MemberDao;
import com.monstar.books.member.dto.MemberDto;

@Primary
@Service
public class MemberInsertService implements MemberService {
	@Autowired
	private SqlSession sqlSession;

	private MemberDto dto;

	public MemberInsertService() {
	}

	public MemberInsertService(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		dto = new MemberDto();
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		// 맵 변환
		Map<String, Object> map = model.asMap();
		// 맵에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String mid = request.getParameter("id");
		String inputPwd = request.getParameter("pwCheck");
		String mname = request.getParameter("name");
		String birth = request.getParameter("birth");
		String mtel = request.getParameter("tel");
		String memail = request.getParameter("email");
		String favoriteArray[] = request.getParameterValues("favorite");
		System.out.println(Arrays.toString(favoriteArray));
		// date 타입으로 변환
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // "yyyy-MM-dd" 패턴 사용
		Date mbirth = null;
		try {
			java.util.Date parsedDate = dateFormat.parse(birth); // String을 java.util.Date로 변환
			mbirth = new java.sql.Date(parsedDate.getTime()); // java.sql.Date로 생성
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String mfavorite=null;
		if (favoriteArray != null) {
		    System.out.println(Arrays.toString(favoriteArray));
		    // 배열을 쉼표로 구분된 문자열로 변환
		    mfavorite = String.join(",", favoriteArray);
		    System.out.println("변환된 선호장르 : " + mfavorite);
		} else {
			mfavorite = "";
		    System.out.println("선호장르가 선택되지 않았습니다.");
		}
		
		// 스프링 시큐리티로 암호화 하기
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPwd = encoder.encode(inputPwd);
		System.out.println("암호화된 비밀번호 : "+encodedPwd);
		
		// 디비에 접속해서 데이터 가져오기
		dto.setMid(mid);
		dto.setMpw(encodedPwd);
		dto.setMname(mname);
		dto.setMbirth(mbirth);
		dto.setMtel(mtel);
		dto.setMemail(memail);
		dto.setMfavorite(mfavorite);
		dao.insert(dto);
//		System.out.println(">> 회원가입 성공여부 : "+ flag);

		model.addAttribute("dto", dto);
	}// override method

}// service