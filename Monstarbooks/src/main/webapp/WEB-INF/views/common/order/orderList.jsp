<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
table{
	width: 1200px;
	border-top: 2px solid #ccc;
	border-bottom: 2px solid #ccc;
	border-collapse: collapse;
	text-align: center;
}
td {
	padding: 0px 10px;
}
.under_line{
	border-bottom: 2px solid #ccc;
}
</style>
</head>
<body>
	
	<table>
		<colgroup>
			<col width="10%">
			<col width="20%">
			<col width="40%">
			<col width="15%">
			<col width="15%">
		</colgroup>
		<tr height="50px" class="under_line">
			<th colspan="2">주문상품</th>
			<td colspan="3">총 ${cnt }개</td>
		</tr>
		<c:forEach items="${dto }" var="list">
		<tr height="150px" class="under_line">
			<td><img src="${pageContext.request.contextPath}/resources/assets/imgs/book/${list.detail.bimg}" 
				alt="책 썸네일 이미지" width="70%"/></td>
			<td colspan="2" align="left">
			<b style="font-size: large">[${list.category.bcategory1}도서] 
				${list.list.btitle } </b> <br /><br /> 
				<b><span style="color: orange">${list.list.bdiscount }%</span> 
				<fmt:formatNumber value="${list.list.bprice }" pattern="#,###" />원</b></td>
			<td>${list.ccount }개</td>
			<td><fmt:formatNumber value="${list.list.bpricesell * list.ccount}" 
				pattern="#,###,###" />원</td>
		</tr>
		</c:forEach>
	</table> 
</body>
</html>