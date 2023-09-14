<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지 주문/배송 목록</title>
<!-- <style>
table {
    border: 1px solid #ddd; /* 테이블 외곽선 추가 */
    width: 100%; /* 테이블 100% 너비로 설정 */
    border-collapse: collapse;
    margin: 0 auto; /* 수평 가운데 정렬 */
}

th {
    padding: 4px;
    border: 1px solid #ddd;
    text-align: center;
}

/* 책 이미지 크기 조절 */
.product-image {
    width: 70px;
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


/* 주문/배송 목록 테이블 스타일 */
.order-table {
    width: 100%; /* 테이블 70% 너비로 설정 */
    float: right;
}

.content {
	display:flex;
	justify-content:space-between;
	text-align: left;
    overflow: hidden; /* 사이드바와 테이블이 겹치지 않도록 처리 */
}

</style> -->
<style>
.mypage-title{
	border-bottom:none;
	padding-bottom:0;
	display: flex;
	justify-content: space-between;
	align-items: center;
	}
.order-item{
	padding:40px 10px;
}
.mypage-content-box table td {
	padding: 40px 10px 40px 40px;
}
</style>
</head>
<script>
	document.title = "몬스타북스:마이페이지(주문/배송)"
</script>
<body>
	<article class="mypage-wrap">
		<section class="mypage-section-wrap">
			<jsp:include page="/WEB-INF/views/tiles/include/mypageMenu.jsp"></jsp:include>
			<div class="mypage-content-box">
				<div class="mypage-title">
					<h3>주문/배송목록</h3>
					<c:choose>
						<c:when test="${totRowcnt > 0}">
							<p>${totRowcnt}건의주문존재합니다.</p>
						</c:when>
						<c:otherwise>
							<p>주문이 없습니다.</p>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="mypage-content bn">
					<!-- 주문/배송 목록 테이블 -->
					<!-- 주문 목록 데이터를 반복해서 출력 -->
					<section class="cart-table-wrap">
					<c:set var="prevOrderNo" value="" />
					<c:forEach var="order" items="${orderList}">
						<c:set var="currentOrderNo" value="${order.orderNo}" />
							<c:if test="${currentOrderNo ne prevOrderNo}">
								<div class="order-item" style="justify-content: space-between; border-top: 1px solid #000; border-bottom:1px solid #000">
									<div>
										<h3>주문상품&nbsp;&nbsp;&nbsp;
										<span>
										<fmt:formatDate
												value="${order.orderDate}" pattern="yy-MM-dd" />
										</span>
										</h3>
										
									</div>
									<p>
										<a class="btn-a gray"
											href="myprofile_orderdetail?orderNo=${order.orderNo}">주문
												상세보기</a> 
									</p>
								</div>
								<c:set var="prevOrderNo" value="${currentOrderNo}" />
							</c:if>
							<table class="bn">
								
								<tr>
									<!-- 상품 정보 -->
									<td class="cart-table-image">
										<div class="product-card-image">
											<img
												src="${pageContext.request.contextPath}/resources/assets/imgs/product/${order.productImage}"
												alt="책 썸네일 이미지" />
										</div>
									</td>
									<td class="left">
										<div class="book-info">
											<div class="book-price">
												<span class="price"> ${order.productPrice}원 </span>
											</div>
										</div>
									</td>
									<!-- 갯수 -->
									<td class="cart-table-price">
										<p>${order.productCount}개</p>
									</td>
									<!-- 가격 -->
									<td class="cart-table-price"><span>
											${order.totalAmount} </span>원</td>
									<td class="right">
										<span class="text-back">
											${order.orderStatus}
										</span>
									</td>
								</tr>
								<c:choose>
									<c:when test="${order.orderStatus eq '배송완료'}">
										<tr>
											<td colspan="5" class="right">
												<a class="btn-a" href="../myreview/insertview?bookno=${order.bookNo}">
												책 리뷰 쓰러가기</a> 
											</td>
										</tr>
									</c:when>
								</c:choose>
								<c:set var="prevOrderNo" value="${currentOrderNo}" />
							</table>
					</c:forEach>
						</section>
					</div>
					<%-- <table class="order-table">
						<tr>
							<th>주문일자</th>
							<th>상품정보</th>
							<th>수량</th>
							<th>가격</th>
							<th>총 가격</th>
							<th>배송 상태</th>
						</tr>
						<!-- 주문 목록 데이터를 반복해서 출력 -->
						<c:set var="prevOrderNo" value="" />
						<c:forEach var="order" items="${orderList}">
							<c:set var="currentOrderNo" value="${order.orderNo}" />
							<c:if test="${currentOrderNo ne prevOrderNo}">
								<tr>
									<td class="center-align-td"><fmt:formatDate
											value="${order.orderDate}" pattern="yyyy.MM.dd" /><br>
										<strong><a
											href="myprofile_orderdetail?orderNo=${order.orderNo}">주문
												상세보기</a> </strong></td>
								</tr>
								<c:set var="prevOrderNo" value="${currentOrderNo}" />
							</c:if>

							<tr>
								<td><img class="product-image"
									src="${pageContext.request.contextPath}/resources/assets/imgs/product/${order.productImage}"
									alt="상품 이미지" align="left"> ${order.productName}</td>
								<td>${order.productCount}개</td>
								<td>${order.productPrice}원</td>
								<td>${order.totalAmount}원</td>
								<td><strong>${order.orderStatus}</strong></td>

								<c:choose>
									<c:when test="${order.orderStatus eq '배송완료'}">
										<tr>
											<td colspan="6" style="text-align: right;"><strong>
													<a href="../myreview/insertview?bookno=${order.bookNo}">
														책 리뷰 쓰러가기</a>
											</strong></td>
										</tr>
									</c:when>
								</c:choose>
								<c:set var="prevOrderNo" value="${currentOrderNo}" />
							</tr>
						</c:forEach>
					</table> --%>

				<!-- mypage-content -->

				<c:if test="${totRowcnt>0}">
					<!-- pagination-wrap -->
				<div class="pagination-wrap">
					<!-- pagination -->
					<div class="pagination">
						<ol>
							<c:choose>
								<c:when test="${searchVO.page>1}">
									<li><a
										href="<c:url value='/myprofile/myprofile_order'><c:param name='page' value='1'/></c:url>"><i
											class="fa-solid fa-angles-left"></i></a></li>
									<li><a
										href="<c:url value='/myprofile/myprofile_order'><c:param name='page' value='${searchVo.page - 1}'/></c:url>">
											<i class="fa-solid fa-angle-left"></i>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a> <i
											class="fa-solid fa-angles-left"></i>
									</a></li>
									<li class="disabled"><a> <i
											class="fa-solid fa-angle-left"></i>
									</a></li>
								</c:otherwise>
							</c:choose>

							<!-- 페이지 갯수 표시 -->
							<c:forEach begin="${searchVo.pageStart}"
								end="${searchVo.pageEnd}" var="i">
								<c:choose>
									<c:when test="${i eq searchVo.page}">
										<li class="current-page"><a> ${i } </a></li>
									</c:when>
									<c:otherwise>
										<!-- 페이지 번호 링크 -->
										<li><a
											href="<c:url value='/myprofile/myprofile_order'><c:param name='page' value='${i}'/></c:url>">${i}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<%-- 
							<!-- 다음 페이지 링크 -->
							<c:if test="${searchVo.page < searchVo.totPage}">
								<li><a
									href="<c:url value='/myprofile/myprofile_order'><c:param name='page' value='${searchVo.page + 1}'/></c:url>">
										<i class="fa-solid fa-angle-right"></i>
								</a></li>
							</c:if> --%>
							<!-- 다음 페이지 링크 -->
							<c:choose>
								<c:when test="${searchVo.page < searchVo.totPage}">
									<li><a
										href="<c:url value='/myprofile/myprofile_order'><c:param name='page' value='${searchVo.page + 1}'/></c:url>">
											<i class="fa-solid fa-angle-right"></i>
									</a></li>
									<li><a
										href="<c:url value='/myprofile/myprofile_order'><c:param name='page' value='${searchVo.totPage }'/></c:url>">
											<i class="fa-solid fa-angles-right"></i>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a> <i
											class="fa-solid fa-angles-right"></i>
									</a></li>
									<li class="disabled"><a> <i
											class="fa-solid fa-angle-right"></i>
									</a></li>
								</c:otherwise>
							</c:choose>
						</ol>
					</div>
					<!-- pagination -->
				</div>
				<!-- pagination-wrap -->
				</c:if>
			</div>
			<!-- ㅡmypage-content-box -->
		</section>
	</article>
</body>
</html>