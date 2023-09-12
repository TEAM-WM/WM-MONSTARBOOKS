package com.monstar.books.event.sevice;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adcoupon.dto.AdCouponDto;
import com.monstar.books.adevent.dao.AdEventDao;
import com.monstar.books.adevent.dto.CouponDto;


@Service
public class CouponlistService implements EventService {

	@Autowired
	private SqlSession session;

	// 생성자
	public CouponlistService(SqlSession session) {
		this.session = session;
	}

	 @Override
	    public void execute(Model model) {
	        System.out.println(">>>쿠폰 리스트 신호");
	        AdEventDao dao = session.getMapper(AdEventDao.class);
	        List<AdCouponDto> dto = dao.couponlist();



	        System.out.println(dto);
	        model.addAttribute("couponlist", dto);
	    }
	}
