package com.monstar.books.adfaq.dao;

import java.util.ArrayList;

import com.monstar.books.adfaq.dto.AdFaqDto;

public interface AdFaqDao {
	
	// faqList
	public ArrayList<AdFaqDto> faqList1();		// 반품/교환/환불
	public ArrayList<AdFaqDto> faqList2();		// 주문취소/변경
	public ArrayList<AdFaqDto> faqList3();		// 배송/수령일 안내
	
	// faqInsert
	public void faqInsert(String fquestion, String fanswer, String fcategory);

	// faqDetail
	public AdFaqDto faqDetail(String faqno);
	
	// faqUpdate
	public void faqUpdate(String faqno, String fquestion, String fanswer,String fcategory);
	
	// faqDelete
	public void faqDelete(String faqno);

}
