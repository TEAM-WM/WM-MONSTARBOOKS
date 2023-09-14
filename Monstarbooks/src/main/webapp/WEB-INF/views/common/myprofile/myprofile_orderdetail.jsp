<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 정보</title>
<!-- <style>
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
</style> -->

</head>
<body>
	<script>
		document.title = "몬스타북스:주문상세";
	</script>
	<article class="mypage-wrap">
		<section class="mypage-section-wrap">
			<jsp:include page="/WEB-INF/views/tiles/include/mypageMenu.jsp"></jsp:include>
			<div class="mypage-content-box">
				<div class="mypage-title">
					<h3>주문상세내역</h3>
				</div>
				<div class="mypage-content bn">
					<section class="cart-table-wrap order-box">
						<div class="order-item">
							<h3>상품정보</h3>
						</div>
						<table class="bn">
							<c:forEach items="${productDetail}" var="product">
								<tr>
									<!-- 상품 정보 -->
									<td class="cart-table-image">
										<div class="product-card-image">
											<img
												src="${pageContext.request.contextPath}/resources/assets/imgs/product/${product.productImage}"
												alt="책 썸네일 이미지" />
										</div> <!-- <img
			                    src="${pageContext.request.contextPath}/resources/assets/imgs/book/${list.detail.bimg}"
			                    alt="책 썸네일 이미지" /> -->
									</td>
									<td class="left">
										<div class="book-info">
											<div class="product-card-title">
												<h3>[${product.category1} / ${product.category2}]
													${product.productName}</h3>
											</div>
										</div>
									</td>
									<!-- 갯수 -->
									<td class="cart-table-price">
										<p>${product.productCount}개</p>
									</td>
									<!-- 가격 -->
									<td><span> ${product.productPrice} </span>원</td>
									<td><span class="text-back">${product.orderStatus}</span>
									</td>
								</tr>
							</c:forEach>
							<c:forEach items="${dto }" var="list">
								<input type="hidden" name="bookno" value="${list.bookno }" />
								<!-- 장바구니에서 주문 -->
								<c:if test="${list.ccount ne 0 }">
									<tr>
										<!-- 상품 정보 -->
										<td class="cart-table-image">
											<div class="product-card-image">
												<img
													src="${pageContext.request.contextPath}/resources/assets/imgs/product/${list.detail.bimg}"
													alt="책 썸네일 이미지" />
											</div> <!-- <img
	                    src="${pageContext.request.contextPath}/resources/assets/imgs/book/${list.detail.bimg}"
	                    alt="책 썸네일 이미지" /> -->
										</td>
										<td class="left">
											<div class="book-info">
												<div class="product-card-title">
													<h3>[${list.category.bcategory1}] ${list.list.btitle }
													</h3>
												</div>
												<div class="book-price">
													<strong class="discount"> ${list.list.bdiscount }%
													</strong> <span class="price"> <fmt:formatNumber
															value="${list.list.bprice }" pattern="#,###" />원
													</span>
												</div>
											</div>
										</td>
										<!-- 갯수 -->
										<td class="cart-table-price">
											<p>
												${list.ccount }개
												<c:if test="${list.ccount eq 0 }">${ccount }개</c:if>
											</p>
										</td>
										<!-- 가격 -->
										<td class="cart-table-price"><span
											class="totPrice_${list.cartno }"> <fmt:formatNumber
													value="${list.list.bpricesell * list.ccount}"
													pattern="#,###,###" />
										</span>원</td>
									</tr>
									<input type="hidden" name="opricesell"
										value="${list.list.bpricesell }" />
									<input type="hidden" name="ocount" value="${list.ccount }" />

								</c:if>

								<!-- 상세페이지에서 바로 주문 -->
								<c:if test="${list.ccount eq 0 }">
									<tr>
										<!-- 상품 정보 -->
										<td class="cart-table-image">
											<div class="product-card-image">
												<img
													src="${pageContext.request.contextPath}/resources/assets/imgs/product/${list.detail.bimg}"
													alt="책 썸네일 이미지" />
											</div> <!-- <img
	                    src="${pageContext.request.contextPath}/resources/assets/imgs/book/${list.detail.bimg}"
	                    alt="책 썸네일 이미지" /> -->
										</td>
										<td class="left">
											<div class="book-info">
												<div class="product-card-title">
													<h3>[${list.category.bcategory1}] ${list.btitle }</h3>
												</div>
												<div class="book-price">
													<strong class="discount"> ${list.bdiscount }% </strong> <span
														class="price"> <fmt:formatNumber
															value="${list.bprice }" pattern="#,###" />원
													</span>
												</div>
											</div>
										</td>
										<!-- 갯수 -->
										<td class="cart-table-price">
											<p>${ccount }개</p>
										</td>
										<!-- 가격 -->
										<td class="cart-table-price"><span> <fmt:formatNumber
													value="${list.bpricesell * ccount}" pattern="#,###,###" />
										</span>원</td>
									</tr>
									<input type="hidden" name="opricesell"
										value="${list.bpricesell }" />
									<input type="hidden" name="ocount" value="${ccount }" />

								</c:if>
							</c:forEach>
						</table>
					</section>
					<section class="order-box order-payment-info">
						<c:choose>
							<c:when test="${not empty orderDetail}">
								<div class="order-item">
									<h3>주문날짜</h3>
									<p>
									<fmt:formatDate value="${orderDetail[0].orderDate}"
												pattern="yyyy.MM.dd" />
									</p>
								</div>
								<div class="order-item">
									<h3>연락처</h3>
									<p>
										${orderDetail[0].dtel}
									</p>
								</div>
								<div class="order-item">
									<h3>수령인</h3>
									<p>
										${orderDetail[0].dname}
									</p>
								</div>
								<div class="order-item">
									<h3>주소지</h3>
									<p>
										${orderDetail[0].daddress2}
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<div class="order-item">
									<h3 style="flex-basis: 100%">주문 상세 정보를 가져오지 못했습니다.</h3>
								</div>
							</c:otherwise>
						</c:choose>
					</section>
					
					<section class="order-box order-payment-info">
					<c:choose>
						<c:when test="${not empty paymentDetail}">
						<div class="order-item">
							<h3>
							총 상품 가격
							</h3>
							<p>
							${paymentDetail[0].totalAmount}원
							</p>
						</div>
						<div class="order-item">
							<h3>
							할인쿠폰
							</h3>
							<p>
							${paymentDetail[0].couponName}
							</p>
						</div>
						<div class="order-item">
							<h3>
							총 결제 금액
							</h3>
							<p>
							${paymentDetail[0].finalpay}원
							</p>
						</div>
						<div class="order-item">
							<h3>
							결제 방법
							</h3>
							<p>
							${paymentDetail[0].paymentMethod}
							</p>
						</div>
						</c:when>
					</c:choose>
					</section>
				</div><!-- mypage-content -->
			</div><!-- mypage-content-box -->
		</section><!-- section-wrap -->
	</article>
</body>
</html>
