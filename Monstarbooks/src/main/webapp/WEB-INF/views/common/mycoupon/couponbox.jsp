<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myprofile_list</title>
<style>
/* 테이블 스타일 */
/* 테이블 내용을 각각의 열로 정렬 */
table.coupon-table {
	position: static;
	top: 150px;
	left: 350px;
	z-index: 2; /* 다른 내용 위에 나타나도록 설정 */
	width: 900px;
	height: 900px;
	align: center;
	margin-right: auto;
}

/* 테이블 내용에 마우스 호버 시 스타일 */
table.coupon-table tr:hover {
	background-color: #f9f9f9;
}

/* 제목 스타일 */
h2 {
	text-align: center;
	font-size: 24px;
	margin-top: 10px;
	margin-bottom: 20px;
}

form {
	width: 900px;
	height: 900px;
	display: table;
	align: center;
	text-align: left;
	margin-left: auto;
	margin-right: auto;
}

th {
	height: 80px;
	color: black;
	background-color: white;
}

tr, td {
	padding: 15px 5px 15px 5px;
	color: graytext;
}

.content {
	display: flex;
	text-align: left;
	justify-content: space-between;
	overflow: hidden; /* 사이드바와 테이블이 겹치지 않도록 처리 */
}
</style>
</head>
<!-- 로그인 시 회원이 등록한 이미지 출력/ 없을 경우 기본 이미지 -->
<body>
	<br />
	<br />

	<div class="content">
		<!-- 왼쪽에 myprofile.jsp 내용 추가 -->
		<div id="myprofile-sidebar">
			<%@ include file="../myprofile/myprofile.jsp"%>
		</div>

		<form action="">
			<div>
				<h2>My Coupon List</h2>
				<br />
				<!-- 쿠폰함 테이블 -->
				<table class="coupon-table">
					<tr>
						<th colspan="2" style="width: 300px;"></th>
						<th style="width: 170px;">쿠폰명</th>
						<th style="width: 110px;">할인금액</th>
						<th style="width: 120px;">유효기간</th>
						<th style="width: 100px;">사용유무</th>
						<th style="width: 100px;" hidden>사용가능(관리자)</th>
					</tr>

					<c:forEach var="mcoupon" items="${mcoupon}" varStatus="loop">
						<tr>
							<c:choose>
								<c:when
									test="${mcoupon.cpstatus eq 'N' and mcoupon.coupon.cpstatus eq 'FALSE'}">
									<td colspan="2" style="width: 300px;"><c:set
											var="imageFileName" value="coupon${loop.index}.png" /> <img
										class="coupon-image"
										src="${pageContext.request.contextPath}/resources/assets/imgs/coupon/${imageFileName}"
										alt="쿠폰이미지" align="left"></td>
									<!-- 3회 반복까지만 설정 -->
									<c:if test="${loop.index == 3}">
									</c:if>
									<!-- 반복 종료 -->
									<td style="width: 170px; color: #33322e; font-weight: bold;">${mcoupon.coupon.cpname}</td>
									<td style="width: 110px; color: #33322e; font-weight: bold;">${mcoupon.coupon.cpprice}
										원</td>
									<td style="width: 10px; color: #33322e; font-weight: bold;"><fmt:formatDate
											value="${mcoupon.cprdate}" pattern="yyyy.MM.dd" /> - <fmt:formatDate
											value="${mcoupon.coupon.cpvalid}" pattern="yyyy.MM.dd" /></td>
									<td style="width: 100px; color: #33322e; font-weight: bold;">${mcoupon.cpstatus}</td>
									<td style="width: 100px;" hidden>${mcoupon.coupon.cpstatus}</td>
								</c:when>
								<c:otherwise>

								</c:otherwise>
							</c:choose>
						</tr>

					</c:forEach>

					<tr>
						<td colspan="6">
					</tr>

				</table>
				<br />
				<!-- 페이징 -->
				<div class="center">
					<a href=""><i class="fa-solid fa-circle-chevron-left"></i></a>

					<c:forEach begin="${searchVO.pageStart }"
						end="${searchVO.pageEnd }" var="i">
						<c:choose>
							<c:when test="${i eq searchVO.page }">
								<span style="font-weight: bold;">${i }</span>
							</c:when>
							<c:otherwise>
								<a href="list?page=${i }" style="text-decoration: none;">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<a href=""><i class="fa-solid fa-circle-chevron-right"></i></a>
				</div>
			</div>
		</form>
	</div>

	<script>
		document.title = "몬스타북스 :: 마이페이지 :: 마이쿠폰";
	</script>
</body>
</html>
