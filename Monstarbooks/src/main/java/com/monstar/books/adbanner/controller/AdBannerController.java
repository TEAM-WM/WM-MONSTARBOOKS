package com.monstar.books.adbanner.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.monstar.books.adbanner.sevice.BannerDeleteService;
import com.monstar.books.adbanner.sevice.BannerService;
import com.monstar.books.adbanner.sevice.BannerServiceDetail;
import com.monstar.books.adbanner.sevice.BannerServiceList;
import com.monstar.books.adbanner.sevice.BannerServiceModify;
import com.monstar.books.adbanner.sevice.BannerServiceWrite;
import com.monstar.books.adbanner.vopage.SearchVO;

@Controller
public class AdBannerController {

	@Autowired
	BannerService service;

	@Autowired
	private SqlSession session;

	@RequestMapping("admin/banner/list")
	public String bannerlist(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("bannerlist");

		model.addAttribute("request", request);
		model.addAttribute("searchVO", searchVO);

		service = new BannerServiceList(session);
		service.execute(model);
		
		return "admin/banner/list";
	}// list 종료
	
	@RequestMapping("admin/banner/bannerdetail")
	public String bannerdetail(HttpServletRequest request, Model model) {
		System.out.println("bannerdetail");

		model.addAttribute("request", request);

		service = new BannerServiceDetail(session);
		service.execute(model);
		
		return "admin/banner/bannerdetail";
	}// detail 종료
	
	@RequestMapping("admin/banner/bannerwriteview")
	public String bannerwriteview() {
		System.out.println("bannerwriteview");


		return "admin/banner/bannerwriteview";
		
	}// bannerwriteview 종료
	
	@RequestMapping("/admin/banner/bannerwrite")
	public String bannerwrite(HttpServletRequest request, Model model) {
	    System.out.println("bannerwrite");

	    model.addAttribute("request", request);

//	    System.out.println("request object: " + request);
	    service = new BannerServiceWrite(session);
	    service.execute(model);


	    return "redirect:/admin/banner/list";
	}// bannerwrite 종료
	
	@RequestMapping("/admin/banner/bannerdelete")
	public String bannerdelete(HttpServletRequest request, Model model) {
	    System.out.println("bannerwrite");

	    model.addAttribute("request", request);

	    service = new BannerDeleteService(session);
	    service.execute(model);

	    return "redirect:/admin/banner/list";
	}//bannerdelete 종료

	@RequestMapping("/admin/banner/bannermodify")
	public String bannermodify(HttpServletRequest request, Model model) {
	    System.out.println("bannermodify");

	    model.addAttribute("request", request);

	    service = new BannerServiceModify(session);
	    service.execute(model);


	    return "redirect:/admin/banner/list";
	}// bannermodify 종료
	@RequestMapping("admin/banner/bannermodifyview")
	public String bannermodifyview(HttpServletRequest request, Model model) {
		System.out.println("bannermodifyview");

		model.addAttribute("request", request);
		
		service = new BannerServiceDetail(session);
		service.execute(model);

		return "admin/banner/bannermodifyview";
	}// bannermodifyview 종료

}
