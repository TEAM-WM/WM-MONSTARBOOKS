<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 정보</title>
<style>
/* 중앙 정렬 */
.center-align {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 60%; /* 화면 높이의 60% 위치에 표시 */
}

/* 컨테이너 스타일 */
.info-container {
	max-width: 1200px;
	width: 90%; /* 가로 길이를 조절하세요. */
	padding: 20px;
}

/* 테이블 스타일 */
.info-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

/* 테이블 헤더 스타일 */
.info-table th {
	background-color: #00004B; /* 배경색을 검은색으로 설정 */
	color: #fff; /* 글씨색을 흰색으로 설정 */
	padding: 10px;
	font-weight: bold;
	text-align: left;
}

/* 테이블 데이터 스타일 */
.info-table td {
	border: 1px solid #ddd;
	padding: 10px;
}
</style>

</head>
<body>
	<script>
		document.title = "몬스타북스:주문상세";
	</script>
	<h2>주문 상세내역</h2>

	<div class="center-align">
		<div class="info-container">
			<!-- 상품 정보 테이블 -->
			<table class="info-table">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">상품 정보</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${productDetail}" var="product">
						<tr>
							<td><img
								src="${pageContext.request.contextPath}/resources/assets/imgs/adorder/${product.productImage}"
								alt="상품 이미지" height="300px"
								style="width: auto; max-width: 100%;"></td>
							<td>
								<p>
									<strong>상품명</strong>: ${product.productName}
								</p>
								<p>
									<strong>가격</strong>: ${product.productPrice}원<br><strong>수량</strong>:
									${product.productCount}개
								</p>
								<p>
									<strong>카테고리</strong>: ${product.category1} /
									${product.category2}
								</p>
								<p>
									<strong>배송상황</strong>: ${product.orderStatus}
								</p>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 주문 정보 테이블 -->
			<table class="info-table">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">주문 정보</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty orderDetail}">
							<tr>
								<th>주문 날짜</th>
								<td><fmt:formatDate value="${orderDetail[0].orderDate}"
										pattern="yyyy.MM.dd" /></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>${orderDetail[0].dtel}</td>
							</tr>
							<tr>
								<th>수령인</th>
								<td>${orderDetail[0].dname}</td>
							</tr>
							<tr>
								<th>주소지</th>
								<td>${orderDetail[0].daddress2}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th colspan="2" style="text-align: center;">주문 상세 정보를 가져오지
									못했습니다.
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>


			<table class="info-table">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">결제 정보</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty paymentDetail}">
							<tr>
								<th>총 상품 가격</th>
								<td>${paymentDetail[0].totalAmount}원</td>
							</tr>
							<tr>
								<th>할인쿠폰</th>
								<td>${paymentDetail[0].couponName}</td>
							</tr>
							<tr>
								<th>총 결제 금액</th>
								<td>${paymentDetail[0].finalpay}원</td>
							</tr>
							<tr>
								<th>결제 방법</th>
								<td>${paymentDetail[0].paymentMethod}</td>
							</tr>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
