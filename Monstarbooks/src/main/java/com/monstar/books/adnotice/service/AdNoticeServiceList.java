package com.monstar.books.adnotice.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.monstar.books.adnotice.dao.AdNoticeDao;
import com.monstar.books.vopage.SearchVo;

public class AdNoticeServiceList implements AdNoticeService {
	private SqlSession sqlSession;
	
	public AdNoticeServiceList(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>> AdNoticeServiceList");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SearchVo searchVo = (SearchVo) map.get("searchVo");
		
		AdNoticeDao dao = sqlSession.getMapper(AdNoticeDao.class);
		
		// search
		String ntitle = "";
		String ncontent = "";
		
		String[] searchType = request.getParameterValues("searchType");
		System.out.println("searchType >> " + searchType);		// o
		
		
		if (searchType != null) {
			for(int i=0; i<searchType.length; i++) {
				System.out.println("searchType : " + searchType[i]);	// o
			}
		}
		
		if(searchType != null) {
			for(String var : searchType) {
				if(var.equals("ntitle")) {
					ntitle = "ntitle";
					model.addAttribute("ntitle","true");
				}else if(var.equals("ncontent")) {
					ncontent = "ncontent";
					model.addAttribute("ncontent","true");
				}
				
			}
		}
		
		// 검색 결과를 유지
		String nt = request.getParameter("ntitle");
		String nc = request.getParameter("ncontent");
		
		if(nt != null) {
			if(nt.equals("ntitle")) {
				ntitle = nt;
				model.addAttribute("ntitle","true");
			}
		}
		if(nc != null) {
			if(nc.equals("ncontent")) {
				ncontent = nc;
				model.addAttribute("ncontent","true");
			}
		}
		
		// sk 값 가져오기
		String searchKeyword = request.getParameter("sk");
		if(searchKeyword == null) {
			searchKeyword = "";
		}
		model.addAttribute("sk",searchKeyword);
		System.out.println("sk >> " + searchKeyword);		// o
		
		// paging
		String strPage = request.getParameter("page");
		// 처음은 null 처리 -> 1페이지로 가게 됨
		if(strPage==null) {
			strPage="1";
		}
		System.out.println("page >> " + strPage);
		int page = Integer.parseInt(strPage);
		searchVo.setPage(page);
		
		int total = 0;
		
		if(ntitle.equals("ntitle") && ncontent.equals("")) {
			total = dao.selectTot1(searchKeyword);
		}else if(ntitle.equals("") && ncontent.equals("ncontent")) {
			total = dao.selectTot2(searchKeyword);
		}else if(ntitle.equals("ntitle") && ncontent.equals("ncontent")) {
			total = dao.selectTot3(searchKeyword);
		}else if(ntitle.equals("") && ncontent.equals("")) {
			total = dao.selectTot4(searchKeyword);
		}
		
		System.out.println("Total: " + total);
		searchVo.pageCalculate(total);
		
		// 페이지번호 전달
		int rowStart = searchVo.getRowStart();
		int rowEnd = searchVo.getRowEnd();
		
		if(ntitle.equals("ntitle") && ncontent.equals("")) {
			model.addAttribute("notice",dao.notice(rowStart,rowEnd,searchKeyword,"1"));
			
		}else if(ntitle.equals("") && ncontent.equals("ncontent")) {
			model.addAttribute("notice",dao.notice(rowStart,rowEnd,searchKeyword,"2"));
			
		}else if(ntitle.equals("ntitle") && ncontent.equals("ncontent")) {
			model.addAttribute("notice",dao.notice(rowStart,rowEnd,searchKeyword,"3"));
			
		}else if(ntitle.equals("") && ncontent.equals("")) {
			model.addAttribute("notice",dao.notice(rowStart,rowEnd,searchKeyword,"4"));
		}
		
		System.out.println("rowStart : " + rowStart);
		System.out.println("rowEnd : " + rowEnd);		// o
		
		model.addAttribute("total",total);
		model.addAttribute("searchVo",searchVo);
		
	}	
}
