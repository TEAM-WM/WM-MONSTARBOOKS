<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리자(주문 목록)</title>
</head>
<body>
	<script>
		document.title = "몬스타북스:주문관리자";
	</script>

	<h1>주문 목록</h1>

	<div>
		<form action="/books/admin/order/list" method="post">
			
			<div>
				<label for="searchDelivery">배송상태 구분</label> <select
					name="searchDelivery" id="searchDelivery">
					<option value="allProduct" id="allProduct"
						${searchDelivery == 'allProduct' ? 'selected' : ''}>전체</option>
					<option value="배송준비중" id="processing"
						${searchDelivery == 'processing' ? 'selected' : ''}>배송준비중</option>
					<option value="배송중" id="inDelivery"
						${searchDelivery == 'inDelivery' ? 'selected' : ''}>배송중</option>
					<option value="배송완료" id="delivered"
						${searchDelivery == 'delivered' ? 'selected' : ''}>배송완료</option>
				</select>
			</div>
			<div>
				<label for="searchType">검색 유형:</label> <select name="searchType"
					id="searchType">
					<option value="">전체</option>
					<option value="productName">도서명</option>
					<option value="memberId">주문자</option>
				</select>
			</div>
				<div>
				<label for="sk">검색:</label> <input type="text" name="sk" value=""
					placeholder="검색어 입력" class="search" /> <input type="submit"
					value="검색" />
			</div>
		</form>

	</div>


	<table border="1" width="80%" align="center" cellspacing="0"
		cellpadding="5">
		<tr>
			<th>주문 번호</th>
			<th>주문자</th>
			<th>주문 날짜</th>
			<th>상품 명</th>
			<th>수량</th>
			<th>주문 금액</th>
			<th>주문 상태</th>
			<th>상세 보기</th>
		</tr>
		<c:forEach items="${getOrderList}" var="order">
			<tr>
				<td>${order.orderNo}</td>
				<td>${order.memberName}&nbsp;(${order.memberId})</td>
				<td>${order.orderDate}</td>
				<td>${order.productName}</td>
				<td>${order.productCount}권</td>
				<td>${order.totalAmount}원</td>
				<td>
					<form action="/books/admin/order/adupdateOrderStatus" method="post">
						<input type="hidden" name="orderNo" value="${order.orderNo}">
						<select name="newStatus" style="float: left;">
							<option value="배송준비중"
								${order.orderStatus == '배송준비중' ? 'selected' : ''}>배송준비중</option>
							<option value="배송중"
								${order.orderStatus == '배송중' ? 'selected' : ''}>배송중</option>
							<option value="배송완료"
								${order.orderStatus == '배송완료' ? 'selected' : ''}>배송완료</option>
						</select>
						<button type="submit" style="float : left">상태
							변경</button>
					</form>
				</td>
				<td><a href="detail?orderNo=${order.orderNo}">상세보기</a></td>
			</tr>
		</c:forEach>
	</table>







<%-- 
	<c:set var="totRowcnt" value="${getOrderList.size()}" />
	<!-- totrowcnt를 주문 목록의 개수를 나타나게 함으로 한개의 주문번호당 한개의 주문으로 표시 -->
 --%>
	<c:choose>
		<c:when test="${totRowcnt > 0}">
			<p>전체 ${totRowcnt}개의 주문이 검색되었습니다.</p>
		</c:when>
		<c:otherwise>
			<p>주문이 없습니다.</p>
		</c:otherwise>
	</c:choose>


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

