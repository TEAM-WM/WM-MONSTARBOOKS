package com.monstar.books.adcoupon.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adcoupon.dao.AdCouponDao;

@Service
public class AdCouponStatusUpdateService implements AdCouponService {

	private SqlSession sqlSession;

	public AdCouponStatusUpdateService(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}

	@Override
	public void execute(Model model) {
		System.out.println(">>AdupdateCouponStatus , 쿠폰상태 변경");

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String cpnoStr = request.getParameter("cpno");
		String newStatus = request.getParameter("newStatus");

		int cpno = 0;

		try {
			cpno = Integer.parseInt(cpnoStr);
		} catch (NumberFormatException e) {
			System.out.println("숫자 변환 불가: " + cpno);
		}

		System.out.println(newStatus);
		System.out.println(cpno);

		AdCouponDao dao = sqlSession.getMapper(AdCouponDao.class);

		dao.adcouponUpdateStatus(cpno, newStatus);

		model.addAttribute("cpno", cpno);
		System.out.println("cpno : " + cpno);

		model.addAttribute("newStatus", newStatus);
		System.out.println("newStatus :" + newStatus);

	}

}
