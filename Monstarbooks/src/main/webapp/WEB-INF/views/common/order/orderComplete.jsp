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
<style>
table{
	width: 1200px;
	border-bottom: 2px solid #ccc;
	border-collapse: collapse;
}
tr{
	height: 50px;
}
td {
	padding: 0px 10px;
}
.under_line{
	border-bottom: 2px solid #ccc;
}
#btn2 {
	width: 200px;
	height: 50px;
	border: 1px solid #ccc;
	border-radius: 10px;
	background-color: #e7e7e7;
	font-weight: bold;
	font-size: 18px;
	margin: 0 10px;
}
#btn3 {
	width: 200px;
	height: 50px;
	border-radius: 10px;
	background-color: #00084f;
	color: white;
	font-weight: bold;
	font-size: 18px;
}
</style>
</head>
<body>
	<h1 align="left" style="margin: 30px;">결제완료</h1>
	
	<!-- 주문 단계 -->
	<div align="right">
		<span style="color: lightgray;">장바구니 <i class="fa-solid fa-circle-chevron-right" style="color: lightgray;"></i>
		주문/결제 <i class="fa-solid fa-circle-chevron-right" style="color: lightgray;"></i></span> 
			<b>결제완료</b></div>

	<br /> <br />
	
	<h2 style="margin:20px 0 100px 0">감사합니다. 주문이 완료되었습니다.</h2>
	
	<!-- 주문정보 테이블 -->
	<table>
	<colgroup>
			<col width="30%">
			<col width="70%">
		</colgroup>
		<tr class="under_line">
			<td><h3>주문 정보</h3></td>
		</tr>
		<tr>
			<th>주문번호</th>
			<td align="left">${dtos.orderno}</td>
		</tr>
		<tr>
			<th>주문일시</th>
			<td align="left"><fmt:formatDate value="${dtos.odetail.oregdate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
		</tr>
	</table>
	
	<br /><br /><br />
	
	<!-- 결제 정보 테이블 -->
	<table>
	<colgroup>
			<col width="30%">
			<col width="70%">
		</colgroup>
		<tr class="under_line">
			<td><h3>결제 정보</h3></td>
		</tr>
		<tr>
			<th>상품 금액</th>
			<td align="left"><fmt:formatNumber value="${dtos.ototalprice}" pattern="#,###"/>원</td>
		</tr>
		<tr>
			<th>쿠폰할인</th>
			<td align="left">쿠폰할인</td>
		</tr>
		<tr>
			<th>배송비</th>
			<td align="left">2,500원</td>
		</tr>
		<tr>
			<th>총 결제금액</th>
			<td align="left"><fmt:formatNumber value="${dtos.ototalprice + 2500}" pattern="#,###"/>원</td>
		</tr>
		<tr>
			<th>결제 방법</th>
			<td align="left">${dtos.opay}</td>
		</tr>
	</table>
	
	<br /><br /><br />
	
	<!-- 주문 상품 정보 -->
	<table>
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
	<div>
		<button id="btn2">주문내역 확인</button>
		<button id="btn3" onclick="location.href='./'">홈으로</button>
	</div>
	
	<script>
	document.title = "몬스타북스 :: 주문완료"; 
</script>
</body>
</html>