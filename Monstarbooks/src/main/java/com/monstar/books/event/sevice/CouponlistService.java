package com.monstar.books.event.sevice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adcoupon.dto.AdCouponDto;
import com.monstar.books.event.dao.EventDao;


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
	        EventDao dao = session.getMapper(EventDao.class);
	        List<AdCouponDto> dto = dao.couponlist();



	        System.out.println(dto);
	        model.addAttribute("couponlist", dto);
	    }
	}
