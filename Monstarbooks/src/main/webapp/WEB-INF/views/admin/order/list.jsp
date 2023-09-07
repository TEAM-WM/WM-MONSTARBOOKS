<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리자(주문 목록)</title>
<style>
.container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px;
}

.delivery-status-select {
	margin-left: auto;
}

.order-status-table-container {
	overflow-x: auto;
}

/* 주문상태 테이블 제목 행을 고정시킴 */
.order-status-table th {
	position: sticky;
	top: 0;
	background-color: white;
}
</style>
</head>
<body>
	<script>
		document.title = "몬스타북스:주문관리자";
	</script>

	<h1>
		<a href="/books/admin/order/list">주문 목록</a>
	</h1>

	<div class="container">
		<!-- 검색 폼 -->
		<form action="/books/admin/order/list" method="post">
			<div>
				<label for="searchType">검색 유형:</label> <select name="searchType"
					id="searchType">
					<option value="" disabled selected>검색 유형을 선택하세요</option>
					<option value="productName">도서명</option>
					<option value="memberId">주문자</option>
				</select>
			</div>

			<div>
				<label for="sk">검색:</label> <input type="text" name="sk" value=""
					placeholder="검색어 입력" class="search" />
			</div>

			<div>
				<input type="submit" value="검색" />
			</div>
		</form>

		<c:choose>
			<c:when test="${param.searchType != null and not empty param.sk}">
				<c:if test="${totRowcnt > 0}">
					<p>전체 ${totRowcnt}개의 주문이 검색되었습니다.</p>
				</c:if>
				<c:if test="${totRowcnt == 0}">
					<p>검색 결과가 없습니다.</p>
				</c:if>
			</c:when>
			<c:otherwise>
				<p></p>
			</c:otherwise>
		</c:choose>


		<!-- 배송상태 구분 -->
		<div class="delivery-status-select">
			<label for="searchDelivery">배송상태 구분:</label> <select
				name="searchDelivery" id="searchDelivery"
				onchange="updateDeliveryStatus()">
				<option value="" disabled selected>배송상태 선택</option>
				<option value="배송준비중" id="processing"
					${searchDelivery == 'processing' ? 'selected' : ''}>배송준비중</option>
				<option value="배송중" id="inDelivery"
					${searchDelivery == 'inDelivery' ? 'selected' : ''}>배송중</option>
				<option value="배송완료" id="delivered"
					${searchDelivery == 'delivered' ? 'selected' : ''}>배송완료</option>
			</select>
		</div>
	</div>

	<!-- 주문 목록 테이블 컨테이너 -->
	<div class="order-status-table-container">
		<table border="1">
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
				<c:if test="${order.orderNo != prevOrderNo}">
					<!-- 새로운 주문 번호일 경우 주문 정보 출력 -->
					<tr>
						<td>${order.orderNo}</td>
						<td>${order.memberName}&nbsp;(${order.memberId})</td>
						<td><fmt:formatDate value="${order.orderDate}"
								pattern="yyyy.MM.dd" /></td>
						<td>
							<!-- productName 및 totalAmount 처리 --> <c:set var="productNames"
								value="" /> <c:set var="totalAmount" value="0" /> <c:forEach
								items="${getOrderList}" var="product">
								<c:if test="${product.orderNo == order.orderNo}">
									<c:set var="productNames"
										value="${productNames}${product.productName} / " />
									<c:set var="totalAmount"
										value="${totalAmount + product.totalAmount}" />
								</c:if>
							</c:forEach> ${fn:substring(productNames, 0, fn:length(productNames) - 2)}
						</td>
						<td>${order.productCount}권</td>
						<td>${totalAmount}원</td>
						<td>
							<form action="/books/admin/order/adupdateOrderStatus"
								method="post">
								<input type="hidden" name="orderNo" value="${order.orderNo}">
								<select name="newStatus" style="float: left;">
									<option value="배송준비중"
										${order.orderStatus == '배송준비중' ? 'selected' : ''}>배송준비중</option>
									<option value="배송중"
										${order.orderStatus == '배송중' ? 'selected' : ''}>배송중</option>
									<option value="배송완료"
										${order.orderStatus == '배송완료' ? 'selected' : ''}>배송완료</option>
								</select>
								<button type="submit" style="float: left">상태 변경</button>
							</form>
						</td>
						<td><a href="detail?orderNo=${order.orderNo}">상세보기</a></td>
					</tr>
					<c:set var="prevOrderNo" value="${order.orderNo}" />
				</c:if>
			</c:forEach>

		</table>

	</div>

	<div>
		<!-- 이전 페이지 링크 -->
		<c:if test="${searchVo.page > 1}">
			<a
				href="<c:url value='/admin/order/list'><c:param name='page' value='${searchVo.page - 1}'/></c:url>">
				<i class="pagelist"></i> <i class="fa-solid fa-circle-chevron-left"></i>
			</a>
		</c:if>

		<!-- 페이지 갯수 표시 -->
		<c:forEach begin="${searchVo.pageStart}" end="${searchVo.pageEnd}"
			var="i">
			<c:choose>
				<c:when test="${i eq searchVo.page}">
					<span style="font-weight: bold;">${i}</span>
				</c:when>
				<c:otherwise>
					<!-- 페이지 번호 링크 -->
					<a
						href="<c:url value='/admin/order/list'><c:param name='page' value='${i}'/></c:url>"
						style="text-decoration: none;">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 다음 페이지 링크 -->
		<c:if test="${searchVo.page < searchVo.totPage}">
			<a
				href="<c:url value='/admin/order/list'><c:param name='page' value='${searchVo.page + 1}'/></c:url>">
				<i class="pagelist"></i> <i class="fa-solid fa-circle-chevron-right"></i>
			</a>
		</c:if>
	</div>

	<!-- <script>
    // 페이지 로드 시 검색 상태 초기화
    window.onload = function () {
        var selectedDeliveryStatus = "${searchDelivery}";
        document.getElementById("searchDelivery").value = selectedDeliveryStatus;
    };

    function updateDeliveryStatus() {
        var selectedDeliveryStatus = document.getElementById("searchDelivery").value;

        // 현재 페이지 URL을 가져와서 기존의 검색 상태를 파악.
        var currentUrl = window.location.href;
        var queryStringIndex = currentUrl.indexOf('?');
        if (queryStringIndex !== -1) {
            var queryString = currentUrl.substring(queryStringIndex + 1);
            var params = new URLSearchParams(queryString);
            var currentSearchDelivery = params.get("searchDelivery");

            // 선택한 배송 상태와 현재 검색 상태가 다를 때만 URL을 업데이트.
            if (currentSearchDelivery !== selectedDeliveryStatus) {
                window.location.href = "/books/admin/order/list?searchDelivery=" + selectedDeliveryStatus;
            }
        } else {
            // 현재 URL에 쿼리 문자열이 없는 경우에도 업데이트.
            window.location.href = "/books/admin/order/list?searchDelivery=" + selectedDeliveryStatus;
        }
    }
</script> -->

	<script>
		function updateDeliveryStatus() {
			var selectedDeliveryStatus = document
					.getElementById("searchDelivery").value;
			window.location.href = "/books/admin/order/list?searchDelivery="
					+ selectedDeliveryStatus;
		}
	</script>
</body>
</html>

