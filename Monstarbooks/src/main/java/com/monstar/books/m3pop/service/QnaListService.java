package com.monstar.books.m3pop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.m3pop.dao.QnaDao;
import com.monstar.books.m3pop.vopage.SearchVO;


@Service
public class QnaListService implements BServiceInter {

	private SqlSession sqlSession;
	
	public QnaListService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println(">>> BListService >>>");
		//----------
		Map<String, Object> map=model.asMap();
		HttpServletRequest request= (HttpServletRequest) map.get("request");
		SearchVO searchVO=  (SearchVO) map.get("searchVO");
		
		
		QnaDao dao=sqlSession.getMapper(QnaDao.class);
//		searching
		String btitle="";
		String bcontent="";
		
		String[] brdtitle=request.getParameterValues("searchType");
		System.out.println("brdtitle:"+brdtitle);
		if (brdtitle!=null) {//null이 아닐때만 돌아라
			for (int i = 0; i < brdtitle.length; i++) {
				System.out.println("brdtitle:"+brdtitle[i]);				
			}
		}
//		변수에 저장
		if (brdtitle!=null) {//null이 아닐때만 돌아라
			for (String var : brdtitle) {
				if(var.equals("qtitle")) {
					btitle="qtitle";
					model.addAttribute("qtitle","true");
				}else if(var.equals("qcontent")) {
					bcontent="qcontent";
					model.addAttribute("qcontent","true");
				}
			}
		}
		//검색결과유지
		String bt=request.getParameter("qtitle");
		String bc=request.getParameter("qcontent");
		
//		변수에 저장
		if (bt!=null) {//null이 아닐때만 돌아라
			if(bt.equals("qtitle")) {
				btitle=bt;
				model.addAttribute("qtitle","true");
			}
		}
		if (bc!=null) {//null이 아닐때만 돌아라
			if(bc.equals("qcontent")) {
				bcontent=bc;
				model.addAttribute("qcontent","true");
			}
		}
		
		
		
//		sk값가져오기		
		String searchKeyword=request.getParameter("sk");
		if (searchKeyword==null) {
			searchKeyword="";
		}
		model.addAttribute("resk",searchKeyword);
		System.out.println("skkkkk:"+searchKeyword);
	
//		paging
		String strPage=request.getParameter("page");
//		처음 null처리
		if(strPage==null)
			strPage="1";
		System.out.println("pageNum:"+strPage);
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		
//		글의 총갯수 구하기
//		int total=dao.selectBoardTotCount();
		
//		검색에 따른 총갯수 변형
		int total=0;
//		4개의 경우의 수로 총갯수 구하기
		if(btitle.equals("qtitle")&& bcontent.equals("")) {
			total=dao.selectBoardTotCount(searchKeyword);
		}else if(btitle.equals("")&& bcontent.equals("qcontent")) {
			total=dao.selectBoardTotCount2(searchKeyword);
		}else if(btitle.equals("qtitle")&& bcontent.equals("qcontent")) {
			total=dao.selectBoardTotCount3(searchKeyword);
		}else if(btitle.equals("")&& bcontent.equals("")) {
			total=dao.selectBoardTotCount4(searchKeyword);
		}
		

		//System.out.println("totcnt : "+total);
		searchVO.pageCalculate(total);
		//계산결과들 출력
		System.out.println("totalcount:"+total);
		//System.out.println("clickpage:"+searchVO.getPage());
		///System.out.println("pageStart:"+searchVO.getPageStart());
		//System.out.println("pageEnd:"+searchVO.getPageEnd());
		//System.out.println("pageTot:"+searchVO.getTotPage());
		//System.out.println("rowStart:"+searchVO.getRowStart());
		//System.out.println("rowEnd:"+searchVO.getRowEnd());
		
		//패이징 글 번호전달
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
//		ArrayList<BoardDto> dtos=dao.list(rowStart,rowEnd);
//		ArrayList<BoardDto> list=null;
		if(btitle.equals("qtitle")&& bcontent.equals("")) {
//			list=dao.list(rowStart,rowEnd,searchKeyword,"1");
			model.addAttribute("list",dao.list(rowStart,rowEnd,searchKeyword,"1"));
		}else if(btitle.equals("")&& bcontent.equals("bcontent")) {
//			list=dao.list(rowStart,rowEnd,searchKeyword,"2");
			model.addAttribute("list",dao.list(rowStart,rowEnd,searchKeyword,"2"));
		}else if(btitle.equals("qtitle")&& bcontent.equals("qcontent")) {
//			list=dao.list(rowStart,rowEnd,searchKeyword,"3");
			model.addAttribute("list",dao.list(rowStart,rowEnd,searchKeyword,"3"));
		}else if(btitle.equals("")&& bcontent.equals("")) {
//			list=dao.list(rowStart,rowEnd,searchKeyword,"4");
			model.addAttribute("list",dao.list(rowStart,rowEnd,searchKeyword,"4"));
		}
		
		
//		ArrayList<BoardDto> dtos=dao.list();
//		model.addAttribute("list",list);
		int listNum=total-((page-1)*5)+1;
		model.addAttribute("listNum",listNum);
		model.addAttribute("totRowcnt",total);
		model.addAttribute("searchVO",searchVO);
		//----------
//		DB에 접속해서 데이터 가져오기
	
		
	}

}
