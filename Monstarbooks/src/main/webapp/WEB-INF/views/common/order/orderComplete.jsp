<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<article class="cart-wrap">
		<section class="cart-title">
			<h2>결제완료</h2>
			<!-- 주문 단계 -->
			<div class="step-list">
				<ul>
					<li>장바구니</li>
					<li>주문/결제</li>
					<li class="active">결제완료</li>
				</ul>
			</div>
		</section>
		<div class="join-success" style="margin-bottom:100px;">
			<i class="fa-solid fa-circle-check"></i>
			<h2>감사합니다.주문이 완료되었습니다.</h2>
		</div>
		<!-- 주문정보 테이블 -->
		<section class="order-box order-payment-info">
	        <div class="order-item">
	            <h3>
	                주문정보
	            </h3>
	        </div>
	         <div class="order-item">
	            <h3>
	                주문번호
	            </h3>
	            <p>
	            ${dtos.orderno}
	            </p>
	        </div>
	        <div class="order-item">
	            <h3>
	                주문일시
	            </h3>
	            <p>
	           <fmt:formatDate value="${dtos.odetail.oregdate}" pattern="yyyy-MM-dd HH:mm:ss"/> 
	            </p>
	        </div>
		</section>
	<!-- 결제 정보 테이블 -->
		<section class="order-box order-payment-info">
			<div class="order-item">
				<h3>결제정보</h3>
			</div>
			<div class="order-item">
				<h3>상품금액</h3>
				<p><fmt:formatNumber value="${dtos.ototalprice -2500 + dtos.coupon.cpprice}" pattern="#,###"/>원</p>
			</div>
			<div class="order-item">
				<h3>쿠폰할인</h3>
				<p>
					- <fmt:formatNumber value="${dtos.coupon.cpprice }" pattern="#,###"/>원
				</p>
			</div>
	        <div class="order-item">
	            <h3>
	                배송비
	            </h3>
	            <p>
	                + 2,500원
	            </p>
	        </div>
	        <div class="order-item">    
	            <h3>
	                총 결제금액
	            </h3>
	            <p>
	                <fmt:formatNumber value="${dtos.ototalprice }" pattern="#,###"/>원
	            </p>
	        </div>
	        <div class="order-item">    
	            <h3>
	               결제방법
	            </h3>
	            <p>
	                ${dtos.opay}
	            </p>
	        </div>
		</section>
		<section class="cart-table-wrap order-box">
			<div class="order-item">
			    <h3>
			        주문상품
			    </h3>
			    <p>
			        총 
			        <strong>
			        	${dtos.count }
			        </strong>
			        개
			    </p>
			</div>
			<table class="bn">
				<c:forEach items="${dto }" var="list">
				<tr>
			    	<!-- 상품 정보 -->
					<td class="cart-table-image">
					    <div class="product-card-image">
					        <img
					      src="${pageContext.request.contextPath}/resources/assets/imgs/product/${list.bdetail.bimg}"
					     alt="책 썸네일 이미지" />
					   </div>
					</td>
					<td class="left">
					    <div class="book-info">
					        <div class="product-card-title">
					            <h3>
					                [${list.category.bcategory1}]
					               ${list.list.btitle }
					           </h3>
					       </div>
					       <div class="book-price">
					           <strong class="discount">
					               ${list.list.bdiscount }%
					           </strong>
					           <span class="price">
					               <fmt:formatNumber value="${list.list.bprice }" pattern="#,###" />원
					            </span>
					        </div>
					    </div>
					</td>
					<!-- 갯수 -->
					<td class="cart-table-price">
					    <p>
					        ${list.odetail.ocount }개
					    </p>
					</td>
					<!-- 가격 -->
					<td class="cart-table-price">
					    <fmt:formatNumber value="${list.odetail.opricesell}"
						pattern="#,###,###" />원
					</td>
				</tr>
			</c:forEach>
			</table>
		</section>
		<section class="order-box order-payment-info">
			<div class="order-item">
				<h3>배송지 정보</h3>
			</div>
			<div class="order-item">
				<h3>수령인</h3>
				<p>
				${dtos.delivery.dname} / 
				<fmt:formatNumber value="${dtos.delivery.dtel}" pattern="000,0000,0000" var="dtel"/>
				<c:out value="${fn:replace(dtel, ',', '-') }"></c:out>
				</p>
			</div>
			<div class="order-item">
				<h3>주소지</h3>
				<p>
				[<fmt:formatNumber value="${dtos.delivery.dzipcode}" pattern="00000"/>]
				${dtos.delivery.daddress1}
				${dtos.delivery.daddress3}
				${dtos.delivery.daddress2}
				</p>
			</div>
		</section>
		<section class="cart-btn-box" style="justify-content: center; margin-top:40px;">
	       <div class="btn-wrap">
	       	<button type="button" onclick="location.href='./myprofile/myprofile_orderdetail?orderNo='+${dtos.orderno}">주문내역 확인</button>
			<button type="button" onclick="location.href='./'">홈으로</button>
	       </div>
	    </section>
	</article>
		<!-- 주문 상품 정보 -->
<%-- 	<table>
		<colgroup>
			<col width="10%">
			<col width="20%">
			<col width="40%">
			<col width="15%">
			<col width="15%">
		</colgroup>
		<tr height="50px" class="under_line">
			<th colspan="2"><h3>주문상품</h3></th>
			<td colspan="3">총 ${dtos.count }개</td>		
		</tr>
		
		<c:forEach items="${dto }" var="list">		
			<tr height="150px" class="under_line">
				<td><img src="${pageContext.request.contextPath}/resources/assets/imgs/book/${list.bdetail.bimg}" 
					alt="책 썸네일 이미지" width="70%"/></td>
				<td colspan="2" align="left">
				<b style="font-size: large">[${list.category.bcategory1}도서] 
					${list.list.btitle } </b> <br /><br /> 
					<b><span style="color: orange">${list.list.bdiscount }%</span> 
					<fmt:formatNumber value="${list.list.bprice }" pattern="#,###" />원</b></td>
				<td>${list.odetail.ocount }개</td>
				<td><fmt:formatNumber value="${list.odetail.opricesell}"
					pattern="#,###,###" />원</td>
			</tr>
		</c:forEach>
	</table>
	
	<br /><br /><br />
	
	<!-- 배송지 정보 -->
	<table>
	<colgroup>
			<col width="30%">
			<col width="70%">
		</colgroup>
		<tr class="under_line">
			<td><h3>배송지 정보</h3></td>
		</tr>
		<tr>
			<th>수령인</th>
			<td align="left">${dtos.delivery.dname} / 
				<fmt:formatNumber value="${dtos.delivery.dtel}" pattern="000,0000,0000" var="dtel"/>
					<c:out value="${fn:replace(dtel, ',', '-') }"></c:out> </td>
		</tr>
		<tr>
			<th>주소지</th>
			<td align="left">[<fmt:formatNumber value="${dtos.delivery.dzipcode}" pattern="00000"/>]
			${dtos.delivery.daddress1}
			${dtos.delivery.daddress3}
			${dtos.delivery.daddress2}</td>
		</tr>
	</table>
	
	<br /><br /><br />
	 --%>
	<script>
	document.title = "몬스타북스 :: 주문완료"; 
</script>
</body>
</html>