package com.monstar.books.adcoupon.service;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.monstar.books.adcoupon.dao.AdCouponDao;

public class AdCouponRegisterService implements AdCouponService {

    private SqlSession sqlSession;

    public AdCouponRegisterService(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void execute(Model model) {
        System.out.println(">>AdCouponRegisterService");

        Map<String, Object> map = model.asMap();
        HttpServletRequest request = (HttpServletRequest) map.get("request");

        AdCouponDao dao = sqlSession.getMapper(AdCouponDao.class);

        // 쿠폰 테이블에 넣을 정보 설정
        String cpnoStr = request.getParameter("cpno");
        int cpno = 0; // 기본값 설정

        if (cpnoStr != null && !cpnoStr.isEmpty()) {
            try {
                cpno = Integer.parseInt(cpnoStr);
            } catch (NumberFormatException e) {
                e.printStackTrace(); // 변환 실패 시 예외 처리
                System.out.println("쿠폰번호 숫자변환 실패");
            }
        }

        String cpname = request.getParameter("cpname");
        System.out.println("네임:"+cpname);
        String cpdescription = request.getParameter("cpdescription"); // cpdescription 변수 추가

        String cppriceStr = request.getParameter("cpprice");
        int cpprice = 0; // 기본값 설정

        if (cppriceStr != null && !cppriceStr.isEmpty()) {
            try {
                cpprice = Integer.parseInt(cppriceStr);
            } catch (NumberFormatException e) {
                e.printStackTrace(); // 변환 실패 시 예외 처리
                System.out.println("쿠폰가격 숫자변환 실패");
            }
        }

        String cpcreatedStr = request.getParameter("cpcreated");
        String cpvalidStr = request.getParameter("cpvalid");

        Date cpcreated = null;
        Date cpvalid = null;

        try {
            if (cpcreatedStr != null && !cpcreatedStr.isEmpty()) {
                cpcreated = Date.valueOf(cpcreatedStr);
            }

            if (cpvalidStr != null && !cpvalidStr.isEmpty()) {
                cpvalid = Date.valueOf(cpvalidStr);
            }
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            System.out.println("날짜 파싱 오류");
        }

        String cpstatus = request.getParameter("cpstatus");
        System.out.println("여기까지는옴");

        dao.insertCoupon(cpname, cpdescription, cpprice, cpcreated, cpvalid, cpstatus);
    }
}
