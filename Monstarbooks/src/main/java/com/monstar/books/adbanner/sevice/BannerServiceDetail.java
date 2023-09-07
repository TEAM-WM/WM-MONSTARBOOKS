package com.monstar.books.adbanner.sevice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adbanner.dao.BannerDao;
import com.monstar.books.adbanner.dto.BannerDto;

@Service
public class BannerServiceDetail implements BannerService {

	@Autowired
	private SqlSession session;

	// 생성자
	public BannerServiceDetail(SqlSession session) {
		this.session = session;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>>배너 디테일 신호");

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int bannerno = Integer.parseInt(request.getParameter("bannerno"));
		BannerDao dao = session.getMapper(BannerDao.class);

		BannerDto dto = dao.bannerdetail(bannerno); // Use BannerDto type here
		System.out.println(bannerno);
		System.out.println(dto.getEfilesrc());
		

		model.addAttribute("bannerdetail", dto);

	}

}
