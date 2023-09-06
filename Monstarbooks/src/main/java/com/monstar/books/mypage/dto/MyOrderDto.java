package com.monstar.books.mypage.dto;

import java.sql.Date;
import java.util.List;

public class MyOrderDto {

	private Date orderDate; // 주문날자
	private Date orderDatedFormatted; // 주문날짜 형식변경

	private int OrderNo;
	private String orderStatus; // 주문상태
	private String category1; // 상위 카테고리
	private String category2; // 하위카테고리
	private String productCount; // 상품수량 -> 책 수량
	private String productPrice; // 상품 판매가 -> 책 판매가
	private String productName; // 상품이름 -> 책 이름
	private String bookNo; //책번호
	
	private String dtel; // 연락처
	
	private String memberId; // 회원 id
	private String orderNO; // 주문번호
	private String totalAmount; // 총 상품가격 (sum(od.pricesell * od.ocount)
	private String productImage; // 책이미지 저장
	
	private String memberName; //회원 이름
	

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getCategory2() {
		return category2;
	}

	public void setCategory2(String category2) {
		this.category2 = category2;
	}

	
	public String getDtel() {
		return dtel;
	}

	public void setDtel(String dtel) {
		this.dtel = dtel;
	}

	private String daddress2;  //주소지

	public String getDaddress2() {
		return daddress2;
	}

	public void setDaddress2(String daddress2) {
		this.daddress2 = daddress2;
	}

	public String getBookNo() {
		return bookNo;
	}
	
	

	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}


	public int countOrdersByOrderNoAndDate(List<MyOrderDto> orderList, String orderNo, Date orderDate) {
		int count = 0;
		for (MyOrderDto order : orderList) {
			if (order.getOrderNO().equals(orderNo) && order.getOrderDate().equals(orderDate)) {
				count++;
			}
		}
		return count;
	}

	public int getOrderNo() {
		return OrderNo;
	}

	public void setOrderNo(int orderNo) {
		OrderNo = orderNo;
	}

	public Date getOrderDatedFormatted() {
		return orderDatedFormatted;
	}

	public void setOrderDatedFormatted(Date orderDatedFormatted) {
		this.orderDatedFormatted = orderDatedFormatted;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getOrderNO() {
		return orderNO;
	}

	public void setOrderNO(String orderNO) {
		this.orderNO = orderNO;
	}

	// 생성자
	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getCategory1() {
		return category1;
	}

	public void setCategory1(String category1) {
		this.category1 = category1;
	}

	public String getProductCount() {
		return productCount;
	}

	public void setProductCount(String productCount) {
		this.productCount = productCount;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
}
