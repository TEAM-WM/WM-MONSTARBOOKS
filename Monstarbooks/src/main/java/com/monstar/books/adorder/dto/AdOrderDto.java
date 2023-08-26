package com.monstar.books.adorder.dto;

import java.sql.Date;


public class AdOrderDto {
    private String memberId;        // VARCHAR2			//회원 id
	private String memberName;		//VARCHAR2			//회원이름
    private int orderNo;			//NUMBER			//주문번호
    private Date orderDate; // DATE					//주문일자
	private String productName;  // VARCHAR2		//상품명
	private int productCount;     // NUMBER		//총가격
    private int totalAmount;  // NUMBER	//결제가격
    private String orderStatus;  // VARCHAR2 주문상태
    private String daddress2;		//주소지
    private int bookCount;  //주문정보에서 여러권의 책이 존재시 ~외 몇권을 알기 위한 조건
    
    
    public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	private String dname;
    
    // Getter와 Setter 메서드 작성
    
    public String getDaddress2() {
		return daddress2;
	}
	public void setDaddress2(String daddress2) {
		this.daddress2 = daddress2;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
    
    
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public int getBookCount() {
		return bookCount;
	}
	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}
}
