package com.monstar.books.adreview.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



import com.monstar.books.adreview.sevice.ReviewService;
import com.monstar.books.adreview.sevice.ReviewServiceDelete;
import com.monstar.books.adreview.sevice.ReviewServiceList;
import com.monstar.books.adreview.vopage.SearchVO;

@Controller
public class AdReviewController {

	@Autowired
	ReviewService service;

	@Autowired
	private SqlSession session;

	@RequestMapping("admin/review/review")
	public String review(HttpServletRequest request,SearchVO searchVO, Model model) {
	    System.out.println("review");

	    model.addAttribute("request", request);
	    model.addAttribute("searchVO", searchVO);

	    service = new ReviewServiceList(session);
	    service.execute(model);
	    
	    return "admin/review/review";
	}
	@RequestMapping("admin/review/delete")
	public String reviewdelete(HttpServletRequest request, Model model) {
	    System.out.println("delete");

	    model.addAttribute("request", request);

	    service = new ReviewServiceDelete(session);
	    service.execute(model);
	    
	    return "redirect:/admin/review/review";
	}

}
