<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지 주문/배송 목록</title>
<style>
table {
	border: 1px solid #ddd; /* 테이블 외곽선 추가 */
	width: 90%;
	height: auto;
	border-collapse: collapse;
	margin: 0 auto; /* 수평 가운데 정렬 */
}

th {
	padding: "4";
	border: 1px solid #ddd;
	text-align: center;
}

/* 이미지 크기 조절 */
.product-image {
	width: 70px; /* 원하는 최대 너비로 조절 */
	height: 100px;
}

/* 가운데 정렬을 위한 스타일 */
.center-align {
	text-align: center;
	vertical-align: middle;
}

.center-align-td {
	text-align: center;
	vertical-align: middle;
}
</style>

</head>
<script>
	document.title="몬스타북스:마이페이지(주문/배송)"
</script>
<body>
	<h1>주문/배송 목록</h1>

	<table>
		<tr>
			<th>주문일자</th>
			<th>상품정보</th>
			<th>수량</th>
			<th>가격</th>
			<th>총 가격</th>
			<th>배송 상태</th>
			<th></th>
			<th></th>
		</tr>

		<!-- 주문 목록 데이터를 반복해서 출력 -->
		<c:set var="prevOrderNo" value="" />
		<c:forEach var="order" items="${orderList}">
			<c:set var="currentOrderNo" value="${order.orderNo}" />
			<c:if test="${currentOrderNo ne prevOrderNo}">
			 <tr style="border-top: 2px solid black;">
				<tr>
				
					<td class="center-align-td">${order.orderDate}<br>
					<strong><a
							href="myprofile_orderdetail?orderNo=${order.orderNo}">주문 상세보기</a>
					</strong>
					</td>
				</tr>
				<c:set var="prevOrderNo" value="${currentOrderNo}" />
			</c:if>
			
			<tr>
				<td></td>
				<td><img class="product-image"
					src="${pageContext.request.contextPath}/resources/assets/imgs/adorder/${order.productImage}"
					alt="상품 이미지" align="left"> ${order.productName}</td>
				<td>${order.productCount}</td>
				<td>${order.productPrice}</td>
				<td>${order.totalAmount}</td>
				<td><strong>${order.orderStatus}</strong></td>

				<c:choose>
					<c:when test="${order.orderStatus eq '배송완료'}">
						<br>
						<tr>
							<td colspan="6" style="text-align: right;"><strong>
									<a href="/myreview/insert?bookNo=${order.bookNo}"> 책 리뷰 쓰러가기</a>
							</strong></td>
						</tr>
					</c:when>
				</c:choose>
				<c:set var="prevOrderNo" value="${currentOrderNo}" />
		</c:forEach>
	</table>

	<c:choose>
		<c:when test="${totRowcnt > 0}">
			<p>전체 ${totRowcnt}개의 주문이 검색되었습니다.</p>
		</c:when>
		<c:otherwise>
			<p>주문이 없습니다.</p>
		</c:otherwise>
	</c:choose>

	<!-- 페이징을 해보자 -->
	<div>
		<!-- 페이징 -->
		<c:if test="${searchVo.totPage > 0}">
			<a href="/order/list?page=1"><i class="pagelist"></i></a>
			<c:if test="${searchVo.page > 1}">
				<a href="/order/list?page=${searchVo.page - 1}"><i
					class="pagelist"></i></a>
			</c:if>
			<c:forEach begin="${searchVo.pageStart}" end="${searchVo.pageEnd}"
				var="i">
				<c:choose>
					<c:when test="${i eq searchVo.page}">
						<span style="color: blue; font-weight: bold;">${i}</span>
					</c:when>
					<c:otherwise>
						<a href="/order/list?page=${i}" style="text-decoration: none;">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${searchVo.page < searchVo.totPage}">
				<a href="/order/list?page=${searchVo.page + 1}"><i
					class="pagelist"></i></a>
			</c:if>
			<a href="/order/list?page=${searchVo.totPage}"><i
				class="pagelist"></i></a>

			<!-- 추가된 부분 -->
			<c:url var="prevUrl" value="${pageContext.request.requestURI}">
				<c:param name="page" value="${searchVo.page - 1}" />
			</c:url>
			<c:url var="nextUrl" value="${pageContext.request.requestURI}">
				<c:param name="page" value="${searchVo.page + 1}" />
			</c:url>

			<c:if test="${searchVo.page > 1}">
				<a href="${prevUrl}">이전 페이지</a>
			</c:if>

			<c:if test="${searchVo.page < searchVo.totPage}">
				<a href="${nextUrl}">다음 페이지</a>
			</c:if>
		</c:if>
	</div>
</body>
</html>