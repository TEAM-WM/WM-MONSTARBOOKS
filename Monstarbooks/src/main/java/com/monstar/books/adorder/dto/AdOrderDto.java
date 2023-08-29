package com.monstar.books.adorder.dto;

import java.sql.Date;


public class AdOrderDto {
    private String memberId;        // VARCHAR2			//회원 id
	private String memberName;		//VARCHAR2			//회원이름
	
    private int orderNo;			//NUMBER			//주문번호
    private Date orderDate; // DATE					//주문일자
    private String orderStatus;  // VARCHAR2       주문상태
    
	private int productCount;     // NUMBER		//상품 수량
	private int productNo;   //책 번호 
	private int productPrice; //상품 판매가
	private String productName;  // VARCHAR2		//상품명
	private String productImage;   //책 이미지 저장 
	
	private String category1;	//상위카테고리
	private String category2;	//하위카테고리
	
	private int totalAmount;  // NUMBER	// 총 상품 가격 SUM(od.opricesell * od.ocount) AS totalAmount
    
    private String paymentMethod; //결제 방식
    private int finalpay; // 결제가격에서 쿠폰을 적용한 총 결제금액
    
    private int bookCount;  //주문정보에서 여러권의 책이 존재시 ~외 몇권을 알기 위한 조건
    
    private String couponName; //사용된 쿠폰 이름
    
    private String daddress2;		//주소지
    
    private String newStatus;   //배송상태를 업데이트 배송준비중,배송중,배송완료
        
    // Getter와 Setter 메서드 작성
    
	public String getNewStatus() {
		return newStatus;
	}
	public void setNewStatus(String newStatus) {
		this.newStatus = newStatus;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
    
    public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
    
	public int getFinalpay() {
		return finalpay;
	}
	public void setFinalpay(int finalpay) {
		this.finalpay = finalpay;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
    
    public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	private String dname;
    
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
