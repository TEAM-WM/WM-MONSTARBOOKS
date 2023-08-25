<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
#btn1 {
	width: 120px;
	height: 50px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin : 10px;
	font-size: 15px;
}

table {
	width: 1000px;
	border-top: 2px solid #ccc;
	border-bottom: 2px solid #ccc;
	border-collapse: collapse;
}
#line {
	border-bottom: 1px solid #ccc;
}
#btn2 {
	width: 100px;
	height: 40px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #e7e7e7;
	font-weight: bold;
}
#btn3 {
	width: 100px;
	height: 40px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #00084f;
	color: white;
	font-weight: bold;
}
</style>
<script>
$(document).ready(function(){
	$("#all_select").click(function(){
		if($("#all_select").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});
});

</script>
</head>

<body>
	<!-- 카테고리 분류 -->
	<div align="left">
		<a href="../"><i class="fa-solid fa-house"></i></a> / 
		<a href="">베스트셀러</a>
	</div>
	<div align="center">
		<h1>베스트셀러</h1>

		<!-- 전체선택,장바구니 버튼 -->
		<div align="right">
			<input type="checkbox" id="all_select" name="all_select" />
			<label for="all_select"></label> <span>전체선택</span>
			<button type="button" id="btn1">
			<img width="25px" 
				src="${pageContext.request.contextPath}/resources/assets/imgs/icon_cart.svg" alt="장바구니" />
				<b>장바구니</b></button>
				
		<!-- 리스트 테이블 -->
		<table>
			<c:forEach items="${dto }" var="list">
				<tr>
					<td rowspan="5" id="line" width="50px" align="center">
						<div>
							<input type="checkbox" id="chk" name="chk" /> <label for="chk"></label>
						</div>
					</td>
					<td rowspan="5" id="line" align="center"><img width="auto" height="200px" 
						src="${pageContext.request.contextPath}/resources/assets/imgs/book/${list.detail.bimg }"
						alt="책 썸네일 이미지" /></td>
					<td>순위</td>
					<td rowspan="5" id="line" align="center">배송예정일</td>
					<td rowspan="5" id="line" align="center"><button type="button" id="btn2">장바구니</button>
						<br /> <br />
						<button type="button" id="btn3">바로구매</button></td>
				</tr>
				<tr>
					<td><h3>
							<a href="bookdetail?bookno=${list.bookno }">${list.btitle }</a>
						</h3></td>
				</tr>
				<tr>
					<td>${list.bwriter }/${list.bpublisher }</td>
				</tr>
				<tr>
					<td><span style="text-decoration: line-through;">
					<fmt:formatNumber value="${list.bprice }" pattern="#,###"/>원 </span> 
					<b><fmt:formatNumber value="${list.bpricesell }" pattern="#,###"/>원</b>
						(${list.bdiscount }%)</td>
				</tr>
				<tr>
					<td id="line">평점 / 태그</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
	<br />
	
	<!-- 페이징 -->
	<a href=""><i class="fa-solid fa-circle-chevron-left"></i></a>
	
	<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i"> 
		<c:choose>
			<c:when test="${i eq searchVO.page }">
				<span style="font-weight:bold;">${i }</span>
			</c:when>
			<c:otherwise>
				<a href="list?page=${i }" style="text-decoration: none;">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>	
	
	<a href=""><i class="fa-solid fa-circle-chevron-right"></i></a>

	<script>
	document.title = "몬스타북스 :: 베스트셀러"; 
	</script>
</body>
</html>