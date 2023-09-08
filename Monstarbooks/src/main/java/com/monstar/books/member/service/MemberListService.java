package com.monstar.books.member.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.member.dao.MemberDao;
import com.monstar.books.member.dto.MemberDto;
import com.monstar.books.vopage.SearchVo;

@Service
public class MemberListService implements MemberService {
	@Autowired
	private SqlSession sqlSession;

	public MemberListService() {}

	public MemberListService(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		// asMap = 인덱스 번호도 같이 가져올수있다.
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String strPage = request.getParameter("page");
		
		
		// 시작 페이지 값이 없다면 1로 변경해준다.
		if (strPage == null) {
			strPage = "1";
		}
		System.out.println("page : " + strPage);
		int page = Integer.parseInt(strPage);

		// 검색 vo에 페이지값 담아주기
		SearchVo searchVO = new SearchVo();
		searchVO.setPage(page);

		// 검색
		// 저장할 변수 선언
		String mid = "";
		String mname = "";
		String[] mtitle = request.getParameterValues("searchType");
		System.out.println("mtitle : " + Arrays.toString(mtitle));
		// 출력되는지 테스트
		if (mtitle != null) {// null 이 아닐때만 돌아주세용
			for (int i = 0; i < mtitle.length; i++) {
				System.out.println("mtitle : " + mtitle[i]);
			}
		}

		// 변수에 저장하기
		if (mtitle != null) {// null 이 아닐때만 돌아주세용
			for (String var : mtitle) {
				if (var.equals("mid")) {
					mid = "mid";
					model.addAttribute("mid","true");
				} else if (var.equals("mname")) {
					mname = "mname";
					model.addAttribute("mname","true");
				}
			}
		}
		
		//페이징에 검색결과유지
		String mi=request.getParameter("mid");
		String mn=request.getParameter("mname");
//		변수에 저장
		if (mi!=null) {//null이 아닐때만 돌아라
			if(mi.equals("mid")) {
				mid=mi;
				model.addAttribute("mid","true");
			}
		}
		if (mn!=null) {//null이 아닐때만 돌아라
			if(mn.equals("mname")) {
				mname=mn;
				model.addAttribute("mname","true");
			}
		}
		// sk 값 Search Keyword 검색어 가져오기
		String searchKeyword = request.getParameter("sk");
		// 검색어 널값 처리
		if (searchKeyword == null) {
			searchKeyword = "";
		}
		System.out.println("검색어 : " + searchKeyword);
		// 검색에 따른 총갯수 변형
		int total = 0;
//		4개의 경우의 수로 총갯수를 구하기
		if (mid.equals("mid") && mname.equals("")) {
			total = dao.selectBoardTotCount1(searchKeyword);
		} else if (mid.equals("") && mname.equals("mname")) {
			total = dao.selectBoardTotCount2(searchKeyword);
		} else if (mid.equals("mid") && mname.equals("mname")) {
			total = dao.selectBoardTotCount3(searchKeyword);
		} else if (mid.equals("") && mid.equals("")) {
			total = dao.selectBoardTotCount4(searchKeyword);
		}
		// 총 갯수
		System.out.println("total cnt: " + total);
		searchVO.pageCalculate(total);
		/* #9 페이징 글 번호 전달 */
		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();
//		ArrayList<BoardDto> dto = dao.list(rowStart, rowEnd);
		ArrayList<MemberDto> dto = null;
		// 리스트에 임의 값 추가
		if (mid.equals("mid") && mname.equals("")) {
			dto = dao.list(rowStart, rowEnd, searchKeyword, "1");
		} else if (mid.equals("") && mname.equals("mname")) {
			dto = dao.list(rowStart, rowEnd, searchKeyword, "2");
		} else if (mid.equals("mid") && mname.equals("mname")) {
			dto = dao.list(rowStart, rowEnd, searchKeyword, "3");
		}else if (mid.equals("") && mname.equals("")) {
			dto = dao.list(rowStart, rowEnd, searchKeyword, "4");
		}
		/* 계산 결과 출력하기 */
		System.out.println("total row: " + total);
		
		
//		// 현재 페이지 정보 가져오기
	    String currentPage = "/admin/member"; // 페이지 이름이나 식별자로 표시할 수 있습니다.
	    System.out.println(currentPage);
		// 모델에 전달하기
	    model.addAttribute("currentPage",currentPage);
		model.addAttribute("searchKey", searchKeyword);
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVO", searchVO);		
		model.addAttribute("dto", dto);
	}// method override

}// class