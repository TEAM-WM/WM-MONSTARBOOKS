<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>couponbox</title>
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
			<%@ include file="myprofile_coupon.jsp"%>
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
									test="${mcoupon.cpstatus eq 'N' and mcoupon.coupon.cpstatus eq 'FALSE' and mcoupon.coupon.cpname eq '신규가입 할인쿠폰'}">
									<td colspan="2" style="width: 300px;"><img
										class="coupon-image"
										src="${pageContext.request.contextPath}/resources/assets/imgs/coupon/coupon0.png"
										alt="쿠폰이미지" align="left"></td>
									<td style="width: 170px; color: #33322e; font-weight: bold;">${mcoupon.coupon.cpname}</td>
									<td style="width: 110px; color: #33322e; font-weight: bold;">${mcoupon.coupon.cpprice}
										원</td>
									<td style="width: 10px; color: #33322e; font-weight: bold;">
										<fmt:formatDate value="${mcoupon.cprdate}"
											pattern="yyyy.MM.dd" /> - <fmt:formatDate
											value="${mcoupon.coupon.cpvalid}" pattern="yyyy.MM.dd" />
									</td>
									<td style="width: 100px; color: #33322e; font-weight: bold;">${mcoupon.cpstatus}</td>
									<td style="width: 100px;" hidden>${mcoupon.coupon.cpstatus}</td>
								</c:when>
								<c:when
									test="${mcoupon.cpstatus eq 'N' and mcoupon.coupon.cpstatus eq 'FALSE' and mcoupon.coupon.cpname eq 'WMBOOK 개업 이벤트'}">
									<td colspan="2" style="width: 300px;"><img
										class="coupon-image"
										src="${pageContext.request.contextPath}/resources/assets/imgs/coupon/coupon1.png"
										alt="쿠폰이미지" align="left"></td>
									<td style="width: 170px; color: #33322e; font-weight: bold;">${mcoupon.coupon.cpname}</td>
									<td style="width: 110px; color: #33322e; font-weight: bold;">${mcoupon.coupon.cpprice}
										원</td>
									<td style="width: 10px; color: #33322e; font-weight: bold;">
										<fmt:formatDate value="${mcoupon.cprdate}"
											pattern="yyyy.MM.dd" /> - <fmt:formatDate
											value="${mcoupon.coupon.cpvalid}" pattern="yyyy.MM.dd" />
									</td>
									<td style="width: 100px; color: #33322e; font-weight: bold;">${mcoupon.cpstatus}</td>
									<td style="width: 100px;" hidden>${mcoupon.coupon.cpstatus}</td>
								</c:when>
								<c:when
									test="${mcoupon.cpstatus eq 'N' and mcoupon.coupon.cpstatus eq 'FALSE' and mcoupon.coupon.cpname eq '가을은 독서 이벤트'}">
									<td colspan="2" style="width: 300px;"><img
										class="coupon-image"
										src="${pageContext.request.contextPath}/resources/assets/imgs/coupon/coupon2.png"
										alt="쿠폰이미지" align="left"></td>
									<td style="width: 170px; color: #33322e; font-weight: bold;">${mcoupon.coupon.cpname}</td>
									<td style="width: 110px; color: #33322e; font-weight: bold;">${mcoupon.coupon.cpprice}
										원</td>
									<td style="width: 10px; color: #33322e; font-weight: bold;">
										<fmt:formatDate value="${mcoupon.cprdate}"
											pattern="yyyy.MM.dd" /> - <fmt:formatDate
											value="${mcoupon.coupon.cpvalid}" pattern="yyyy.MM.dd" />
									</td>
									<td style="width: 100px; color: #33322e; font-weight: bold;">${mcoupon.cpstatus}</td>
									<td style="width: 100px;" hidden>${mcoupon.coupon.cpstatus}</td>
								</c:when>
								<c:otherwise>
									<!-- 다른 경우에 대한 처리를 여기에 추가 -->
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td colspan="7">
								<%--  				<input type="hidden" name="memberno" value="${mcoupon.member.memberno}" /> --%>
							</td>
						</tr>
					</c:forEach>

				</table>
				<br />
				<!-- 페이징 -->
				<div class="center">
					<hr />
					<c:if test="${searchVO.page>1}">
						<a href="couponbox?page=1"><i class="fa-solid fa-angles-left"></i></a>
						<a href="couponbox?page=${searchVO.page-1 }"><i
							class="fa-solid fa-circle-chevron-left"></i></a>
					</c:if>
					<c:forEach begin="${searchVO.pageStart }"
						end="${searchVO.pageEnd }" var="i">
						<c:choose>
							<c:when test="${i eq searchVO.page }">
								<span style="color: red; font-weight: bold;">${i }</span>
							</c:when>
							<c:otherwise>
								<a href="couponbox?page=${i }" style="text-decoration: none;">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${searchVO.page < searchVO.totPage}">
						<a href="couponbox?page=${searchVO.page+1 }"><i
							class="fa-solid fa-circle-chevron-right"></i></a>
						<a href="couponbox?page=${searchVO.totPage }"><i
							class="fa-solid fa-angles-right"></i></a>
					</c:if>
				</div>
			</div>
		</form>
	</div>

	<script>
		document.title = "몬스타북스 :: 마이페이지 :: 마이쿠폰";
	</script>
</body>
</html>
