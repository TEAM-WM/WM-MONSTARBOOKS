package com.monstar.books.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.member.dao.MemberDao;
import com.monstar.books.member.dto.MemberDto;

@Service
public class MemberPwdFindService implements MemberService {
	@Autowired
	private SqlSession sqlSession;

	public MemberPwdFindService() {}

	public MemberPwdFindService(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		System.out.println("비밀번호 찾기 dao : "+dao);
		Map<String, Object> map = model.asMap();
		// 맵에서 request 추출
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		//이름, 전화번호로 아이디를 찾을때
		MemberDto dto = new MemberDto();
		
		if(id!=null && name!=null && email !=null) {
			dto.setMid(id);
			dto.setMemail(email);
			dto.setMname(name);
			model.addAttribute("info",email);
		}else {
			dto.setMid(id);
			dto.setMname(name);
			dto.setMtel(tel);
			model.addAttribute("info",tel);
		}
		//1. 아이디, 이름, 휴대폰 번호 로 일치하는 비밀번호 찾기(dao 사용)
		String pwd=dao.pwdSearch(dto);
		System.out.println("비밀번호 찾기 아이디 : "+dto.getMid());
		System.out.println("비밀번호 찾기 얻어온 비밀번호 : "+pwd);
		
		//작업 성공여부
		boolean isSuccess=false;
		String newPwd = "";
		//비밀번호를 찾았다면
		if(pwd != null) {
			//2. 임시 비밀번호 랜덤으로 생성
			for (int i = 0; i < 12; i++) {
				newPwd += (char) ((Math.random() * 26) + 97);
			}
			//새 비밀번호를 암호화
			BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
			String encodednewPwd=encoder.encode(newPwd);
			//새 비밀번호를 dto 에 다시 담
			dto.setMnewpwd(encodednewPwd);
			//DB에 비밀번호 반영하기
			dao.updatePwd(dto);
			//성공
			isSuccess=true;
		}
		System.out.println(newPwd);
		//3. 임시 비밀번호 담기
		model.addAttribute("id",id);
		model.addAttribute("newPwd",newPwd);
		model.addAttribute("isSuccess",isSuccess);
			

	}// method override

}// class