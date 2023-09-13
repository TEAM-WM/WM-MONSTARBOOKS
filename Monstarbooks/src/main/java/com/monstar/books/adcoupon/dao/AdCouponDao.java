package com.monstar.books.adcoupon.dao;

import java.sql.Date;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.monstar.books.adcoupon.dto.AdCouponDto;

public interface AdCouponDao {

	public ArrayList<AdCouponDto> getCouponList(int rowStart, int rowEnd, String sk);

	public ArrayList<AdCouponDto> selectcpname(int rowStart, int end, String sk);
	
	public ArrayList<AdCouponDto> selectcpdescription(int rowStart, int end, String sk);

    public void adcouponUpdateStatus(int cpno, String newStatus);
    
    public void insertCoupon(@Param("cpname")String cpname,@Param("cpdescription")String cpdescription, 
    						 @Param("cpprice")int cpprice
    						,@Param("cpcreated")Date cpcreated, 
    						@Param("cpvalide")Date cpvalid,@Param("cpstatus")String cpstatus);
    
		public int selectCouponTotCount1(String searchKeyword); // 쿠폰 이름 검색

	public int selectCouponTotCount2(String searchKeyword); // 쿠폰 설명 검색

	public int selectCouponTotCount3(String searchKeyword); // 디폴트 상태

}
