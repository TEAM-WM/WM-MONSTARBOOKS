package com.monstar.books.adbanner.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adbanner.dao.BannerDao;
import com.monstar.books.adbanner.dto.BannerDto;
import com.monstar.books.adbanner.vopage.SearchVO;
@Primary
@Service
public class BannerServiceList implements BannerService{

	@Autowired
	private SqlSession session;

	// 생성자
	public BannerServiceList(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>배너 리스트 신호");
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		SearchVO searchVO=(SearchVO) map.get("searchVO");
		
		BannerDao dao=session.getMapper(BannerDao.class);

	    String e_etitle = request.getParameter("e_etitle");
	    System.out.println("e_etitle: " + e_etitle);


		
//		검색
		String etitle = "";
		String efilesrc = "";
		String[] brdtitle = request.getParameterValues("searchType");
		System.out.println("brdtitle : " + brdtitle);
		if (brdtitle != null) {
			for (int i = 0; i < brdtitle.length; i++) {
				System.out.println("brdtitle : " + brdtitle[i]);
			}
		}
//	      변수 저장
		if (brdtitle != null) {
			for (String var : brdtitle) {
				if (var.equals("etitle")) {
					etitle = "etitle";
					model.addAttribute("etitle", "true");
				} else if (var.equals("efilesrc")) {
					efilesrc = "efilesrc";
					model.addAttribute("efilesrc", "true");
				}
			}
		}
//	      검색결과 유지
		String et = request.getParameter("etitle");
		String ef = request.getParameter("efilesrc");
//	      변수 저장
		if (et != null) {
			if (et.equals("etitle")) {
				etitle =et;
				model.addAttribute("etitle", "true");
			}
		}
		if (ef != null) {
			if (ef.equals("efilesrc")) {
				efilesrc = ef;
				model.addAttribute("efilesrc", "true");
			}
		}

//	    sk값 가져오기
		String searchKeyword = request.getParameter("sk");
		if (searchKeyword == null) {
			searchKeyword = "";
		}
		model.addAttribute("resk", searchKeyword);
		
		System.out.println("sk:" + searchKeyword);
		
//		paging
		String strPage=request.getParameter("page");
		if (strPage==null) 
			strPage="1";
			System.out.println(strPage);
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		
//		검색어에 따른 총 갯수 변화
		int total = 0;
//		4개의 경우의 수로 총갯수 구하기
		if (etitle.equals("etitle") && efilesrc.equals("")) {
			total = dao.selectBoardTotCount1(searchKeyword);
		} else if (etitle.equals("") && efilesrc.equals("efilesrc")) {
			total = dao.selectBoardTotCount2(searchKeyword);
		} else if (etitle.equals("qtitle") && efilesrc.equals("efilesrc")) {
			total = dao.selectBoardTotCount3(searchKeyword);
		} else if (etitle.equals("") && efilesrc.equals("")) {
			total = dao.selectBoardTotCount4(searchKeyword);
		}
		System.out.println("tot" + total);
		
		searchVO.pageCalculate(total);
		
//		paging 글 번호 전달
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		ArrayList<BannerDto> list = null;

		if (etitle.equals("etitle") && efilesrc.equals("")) {
			model.addAttribute("list", dao.list(rowStart, rowEnd, searchKeyword, "1"));
		} else if (etitle.equals("") && efilesrc.equals("efilesrc")) {
			model.addAttribute("list", dao.list(rowStart, rowEnd, searchKeyword, "2"));
		} else if (etitle.equals("qtitle") && efilesrc.equals("efilesrc")) {
			model.addAttribute("list", dao.list(rowStart, rowEnd, searchKeyword, "3"));
		} else if (etitle.equals("") && efilesrc.equals("")) {
			model.addAttribute("list", dao.list(rowStart, rowEnd, searchKeyword, "4"));
		}

	    model.addAttribute("e_etitle", e_etitle);
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVO", searchVO);
	}

}

